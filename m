Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440483F2574
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Aug 2021 05:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235776AbhHTD57 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 23:57:59 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50989 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235156AbhHTD56 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 23:57:58 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 68D4F580B0E;
        Thu, 19 Aug 2021 23:57:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 19 Aug 2021 23:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=U
        jmLtA+f8OC3+lbFmpzvt1mYLDqKmlXSvR6zMgM6p1A=; b=GxElH6unmVGlWH1XX
        xSciszONKWEZ4UrBmkA650Mjbaef43UhTvWDM6fag5s0kzUdcdaOQQBHze3VukOA
        r0wS/L55YW9kyBZONqR4ivtqi4AlelWftqunRuptqVQudIXU+PxZ21dp/95aUxpN
        yF/XiqXnTHb4XDf1rS0EIaKajm8IUgnSzK1m2VcrwfJRacFeb23/77EKQzDWeViv
        5m36/6FibT4sKTFXy+JawD69Sz4++GyS66JRvVPKHEbKLajy3ctVuZ5jC3J40pHp
        uSzywtbnYnfqYmAEUnccA7Bt6L4FGTnbIzK4wtWxCbOLZl6e5yLgrIo3qtwHGP57
        YZhqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=UjmLtA+f8OC3+lbFmpzvt1mYLDqKmlXSvR6zMgM6p
        1A=; b=neiht85Bgu9HmSeDxveJQpmMXAaDoAe7lerhbWe5+y4R99ejb6FOtBhHk
        rIK3nJpQ02VCD9zA9wyFWl6FCjNA1p23eF5GbGWPNk3lHDLYfGJCp3685mdY5a7y
        7K1Q7pp/x4OoNu/Ue5gPxQZYm1GqsFimZ5C+cn9E0jBMQ6Y014tIikqw9OEQ41c9
        VvL3bFQ4y0eIZXDPKZtN0bS9BlamR1yeOKj+FDLQewLVC0N4x/oG40F5aDGJcGMA
        g698O+f0xqciOMVhKCgVmtUdwgusMqmB0M3FYVVjBH7fhi2ROBrtqiDcjLf7XhE+
        RJ+EXB+Eg/hnqzP1ddyWFukENjmmA==
X-ME-Sender: <xms:HCgfYanmo28FcpWj-bTXtHwllKR4hMhu9nvxBO3HUlOPl00w81LwCQ>
    <xme:HCgfYR0ox0MWidTstZ6XrquAfYXQ8tmO-sipC4XiE0qKsk2DziZalPKrtGdbepQ6g
    j363Xv5ORu_cl-GzQ>
X-ME-Received: <xmr:HCgfYYp68uHhhCpZEcTCWL_Ib2rIdIIB-98-ndbJhqCQBOjB-kELOlddipoGV-qN5Dp_8jwLVq0gjLTIC-cIgESvwCvGjTYlO2hFZA6yD4F7iDw4Kfn86JNQMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleekgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeetteffjeefhfegtdduledutdegudffleduueeftddvlefgieffveef
    hfdukeegvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:HCgfYemUcfbGXxM6CwpXu0wkmFrvIXMMBqHbH5whVhZNXZ-7SU9pzQ>
    <xmx:HCgfYY2BNYsD0I44glEMho1T7Ho1X1OdijCUTN4C1oqdge-NUJxAaw>
    <xmx:HCgfYVtzD41eBUxZxqy-oCnO4WAB67hYluQjZYB62GyifEiiEYOClQ>
    <xmx:HygfYT0qoh3_k0BXyvrsVkw-pEEIE9pwC6TI43KI-JjtO9r8uYZkOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 23:57:15 -0400 (EDT)
Subject: Re: [PATCH v8 02/11] dt-bindings: rtc: sun6i: Add H616 compatible
 string
To:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
 <20210726144137.6dauuxdssu7yszox@gilmour>
 <20210802013938.29fa18ed@slackpad.fritz.box>
 <20210817073810.7stuzrppyjf4spab@gilmour>
 <20210818100407.7cf7cfb7@slackpad.fritz.box>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <2b0504f6-9e01-88c1-84c9-c7714715dcb7@sholland.org>
Date:   Thu, 19 Aug 2021 22:57:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210818100407.7cf7cfb7@slackpad.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/18/21 4:04 AM, Andre Przywara wrote:
> On Tue, 17 Aug 2021 09:38:10 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
> 
> Hi Maxime,
> 
>> On Mon, Aug 02, 2021 at 01:39:38AM +0100, Andre Przywara wrote:
>>> On Mon, 26 Jul 2021 16:41:37 +0200
>>> Maxime Ripard <maxime@cerno.tech> wrote:
>>>   
>>>> Hi,
>>>>
>>>> On Fri, Jul 23, 2021 at 04:38:29PM +0100, Andre Przywara wrote:  
>>>>> Add the obvious compatible name to the existing RTC binding.
>>>>> The actual RTC part of the device uses a different day/month/year
>>>>> storage scheme, so it's not compatible with the previous devices.
>>>>> Also the clock part is quite different, as there is no external 32K LOSC
>>>>> oscillator input.
>>>>>
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>>
>>>>> ---
>>>>>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++++++++
>>>>>  1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>>>>> index beeb90e55727..d8a6500e5840 100644
>>>>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>>>>> @@ -26,6 +26,7 @@ properties:
>>>>>            - const: allwinner,sun50i-a64-rtc
>>>>>            - const: allwinner,sun8i-h3-rtc
>>>>>        - const: allwinner,sun50i-h6-rtc
>>>>> +      - const: allwinner,sun50i-h616-rtc
>>>>>  
>>>>>    reg:
>>>>>      maxItems: 1
>>>>> @@ -104,6 +105,19 @@ allOf:
>>>>>            minItems: 3
>>>>>            maxItems: 3
>>>>>  
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: allwinner,sun50i-h616-rtc
>>>>> +
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clock-output-names:
>>>>> +          minItems: 3
>>>>> +          maxItems: 3    
>>>>
>>>> You don't need both of them when they are equal
>>>>   
>>>>> +        clocks: false
>>>>> +    
>>>>
>>>> It's not entirely clear to me what those clocks are about though. If we
>>>> look at the clock output in the user manual, it looks like there's only
>>>> two clocks that are actually being output: the 32k "fanout" clock and
>>>> the losc. What are the 3 you're talking about?]  
>>>
>>> I see three: the raw SYSTEM "CLK32K_LOSC", the RTC input + debounce
>>> clock (/32), and the multiplexed PAD.  
>>
>> But the input and debounce clock is only for the RTC itself right? So it
>> should be local to the driver and doesn't need to be made available to
>> the other drivers
> 
> I understood "debounce" as being the clock used for the pinctrl
> debouncer. What would it debounce otherwise? Do you think that this
> "debounce circuit" is something internal to the RTC and is totally
> irrelevant for us?

I'm pretty sure this is the debounce for the NMI and the SoC reset signal, not
the pinctrl. The pinctrl debounce clock pretty clearly references 32 kHz.

> But in general I looked at how many *different* clocks this diagram
> describes, and I count: one unaltered ("SYSTEM"), one "div by
> 32" (RTC/debounce), and one multiplexed. My aim was to avoid
> DT binding changes when we later discover we do need one of them for
> something (as happened in the past). So three seemed to be the safe
> choice here, to avoid surprises. In the worst case we just will never
> reference one of them.

Plus RC16M/IOSC (and depending on how you look at it, DCXO24M/HOSC).

>> Either way, what this list is must be documented.
> 
> You mean to overwrite the "description" stanza for clock-output-names?
> And can this be done in the per-SoC parts in the later part of the
> binding, keeping the existing description?
> 
> Cheers,
> Andre
> 
>>
>>>> Also, it looks like the 32k fanout clock needs at least the hosc or
>>>> pll-periph in input, so we probably don't want to ask for no parent
>>>> clock?  

Do you suggest we fix this for the existing bindings?

>>> Well, we never seem to reference the HOSC this way, this was always
>>> somewhat explicit. And yes, there is PLL-PERIPH as an input, but we
>>> don't support this yet. So I went with 0 input clocks *for now*: the
>>> driver can then ignore all clocks, so any clock referenced in the DT
>>> later won't cause any harm. This will all be addressed by Samuel's RTC
>>> clock patch, which will also touch the H6, IIRC. And it looks like we
>>> will need to touch the binding anyway then, but can then just *extend*
>>> this.  
>>
>> You mentioned that series several times already and never provided an
>> explanation for what it was supposed to be doing except fixing
>> everything. What's the general plan for that series?

This is my fault for not sending anything yet. Since the initial version of the
driver had the RTC providing HOSC, it depended on converting the existing A100,
H6, and H616 CCU drivers to use .fw_name for parents, since those drivers
hardcode two different global names for HOSC. And I had no opportunit to do that
yet.

However, I should really send something that 100% matches the current binding
for SoCs where that exists (i.e. osc24M is a fixed clock), and doing so is a
smaller job.

On the other hand, having osc24M as an RTC *output* neatly sidesteps the fact
that it has been missing from the input list :)

(But on the other-other hand, A50 gets even more fun, as the HOSC crystal may
not be 24MHz anymore. So the RTC has to choose one of three possible HOSC->LOSC
dividers based on the HOSC frequency. But there is no register for HOSC
frequency. So in this case it is convenient to have HOSC as a separate fixed
clock input.)

The basic idea of my patch is that using the CCU library code lets us cleanly
have slightly different clock trees for each of the RTC variants that Allwinner
comes up with.

The secondary goal is to add support for osc32k calibration.

An early version of the patch is here[1], and I will send something as soon as I
have made the modifications described above. But I know you were skeptical about
moving the clock part out of the RTC driver. So if you NACK that, somebody will
have to add all of the variants to the RTC driver.

Regards,
Samuel

[1]: https://github.com/smaeul/linux/commit/9510ca9e95cb.patch
