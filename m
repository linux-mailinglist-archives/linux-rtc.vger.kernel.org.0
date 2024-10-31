Return-Path: <linux-rtc+bounces-2395-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB089B77D4
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 10:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53E73B25E78
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 09:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54821197A72;
	Thu, 31 Oct 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZstoKDK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FC2195FD5;
	Thu, 31 Oct 2024 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368023; cv=none; b=uPQ1327qWHv6dAFnB8bC+ND3r8NYKr7BJvjDcDlNY9SR23NljFmXuFQ02Jb1e2qqatr5Rt9lhv+H6JrbZb/1bZ9Oo2RqCOCEij/6Y5Z2pLTxvYHk5T3NcQNqo7TSE6IFkvgKBkYlrD8ssmHAUR8fVqKThjmY/jp9HjBtQAljUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368023; c=relaxed/simple;
	bh=14EtJIhlpM+v+RMq+CVjwcw2wUF+OrDzYqWObG4FJgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekVOS8BLeCj7xYlI+0FTH5zCthegVa6xWtFLC7kaxXtHnjVtWQrBaJQrOB1196fjxJ2n+FEnjV1t0yRNPyhmZXwTscuODZRw0sgwHuk8tlZt/vEz/LJBc8GEQ0w2MH3mIxIJI7GKpxzgQuplI/oUSpc8jss0kJxUY9atnKCIzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZstoKDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96918C4CEC3;
	Thu, 31 Oct 2024 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730368022;
	bh=14EtJIhlpM+v+RMq+CVjwcw2wUF+OrDzYqWObG4FJgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IZstoKDKKzDLkYiDEvMejvA8SBJXvf+X4vt8iaEs7uCcfiO+7jmy1JmLq968Mw7Xr
	 AKxBtsb7S+SaG5vOHA3BcPPe28DT9DnSa+kXy1y1jTNJQAmL/dmZxNOFPPISUjJFm3
	 fZt4y8xofetZ6LcQUXHS3bQZfL/jykiB/pN71RLo4T/nrdFdNIdadx72C59t6uThNt
	 M72lj8bkg4UEJocBRQO3ryHkd/gkUlgfwmCozbzkda99Rn9jMVvv+qe1PMrecrKsvj
	 OWKhAWOH12Pn05VbEuHeX3aw3OA5IgdIhiFvySXduI/bi+P3+pCFIB8m2yKKmg91px
	 cfm2P2Wyc4RsA==
Message-ID: <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
Date: Thu, 31 Oct 2024 10:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
 <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
 <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
 <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 10:26, Claudiu Beznea wrote:
> Hi, Geert, Krzysztof,
> 
> On 31.10.2024 10:43, Geert Uytterhoeven wrote:
>> Hi Krzysztof,
>>
>> On Thu, Oct 31, 2024 at 8:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
>>>> by the RTC. The input to the VBATTB could be a 32KHz crystal
>>>> or an external clock device.
>>>>
>>>> The HW block diagram for the clock generator is as follows:
>>>>
>>>>            +----------+ XC   `\
>>>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>>>            | 32K clock|      |  |----->|gate|----------->
>>>>            | osc      | XBYP |  |      +----+
>>>> RTXOUT --->|          |----->| /
>>>>            +----------+      ,
>>>>
>>>> After discussions w/ Stephen Boyd the clock tree associated with this
>>>> hardware block was exported in Linux as:
>>>>
>>>> vbattb-xtal
>>>>    xbyp
>>>>    xc
>>>>       mux
>>>>          vbattbclk
>>>>
>>>> where:
>>>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>>>> - xc, xbyp are mux inputs
>>>> - mux is the internal mux
>>>> - vbattclk is the gate clock that feeds in the end the RTC
>>>>
>>>> to allow selecting the input of the MUX though assigned-clock DT
>>>> properties, using the already existing clock drivers and avoid adding
>>>> other DT properties. If the crystal is connected on RTXIN,
>>>> RTXOUT pins the XC will be selected as mux input. If an external clock
>>>> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
>>>> mux input.
>>>>
>>>> The load capacitance of the internal crystal can be configured
>>>> with renesas,vbattb-load-nanofarads DT property.
>>>>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>>>> --- a/drivers/clk/renesas/Kconfig
>>>> +++ b/drivers/clk/renesas/Kconfig
>>>> @@ -237,6 +237,10 @@ config CLK_RZV2H
>>>>       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>>>>       select RESET_CONTROLLER
>>>>
>>>> +config CLK_RENESAS_VBATTB
>>>> +     bool "Renesas VBATTB clock controller"
>>>
>>> tristate
>>
>> Good point.
>> However, does it work as a module, or would that break the RTC?
> 
> On RZ/G3S the RTC counter needs the clock provided by VBATTB.
> 
> I'll try with this as a module.

So it will defer, why would this be a problem? This does not look like
critical core component, which would halt the system probe (and even
then systems like Android put everything as modules).

Best regards,
Krzysztof


