<script lang="ts">
	import type { PlatformType } from '$lib/types';
	import { getPlatformString } from '../../utils/platform';

	interface Props {
		platforms: PlatformType[];
	}

	let { platforms }: Props = $props();

	let platformsString = $derived((platforms || []).reduce((acc, curr, index) => {
		const platformRepresentation = getPlatformString(curr);

		if (!acc) return platformRepresentation;

		if (index === platforms.length - 1) {
			return `${acc} & ${platformRepresentation}`;
		}

		return `${acc}, ${platformRepresentation}`;
	}, ''));
</script>

<div class="flex flex-row">
	<svg class="h-10 w-10" fill="none" xmlns="http://www.w3.org/2000/svg"
		><path
			d="M13.358 14.752H4.97a1.048 1.048 0 01-1.047-1.048V6.286c0-.579.469-1.048 1.047-1.048H17.08c.579 0 1.048.47 1.048 1.048v1.33M11.424 15.152v1.21M9.304 16.362h3.653"
			stroke="#666"
			stroke-width=".8"
			stroke-linecap="round"
			stroke-linejoin="round"
		/><rect
			x="14.543"
			y="8.955"
			width="3.914"
			height="7.371"
			rx=".648"
			stroke="#666"
			stroke-width=".8"
		/><path stroke="#666" stroke-width=".8" d="M16.028 15.174h1.048" /></svg
	>
	<p class="text-base">
		{platformsString}
	</p>
</div>
