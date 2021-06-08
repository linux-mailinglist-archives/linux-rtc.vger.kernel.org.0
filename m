Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C6039ED70
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jun 2021 06:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhFHEZB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Jun 2021 00:25:01 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50627 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229451AbhFHEZB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Jun 2021 00:25:01 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 39EAF580380;
        Tue,  8 Jun 2021 00:23:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 08 Jun 2021 00:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=D
        breLLCI1Z3Z70YI4GhLwoUgolRQXxKS5uyu6JXhpEI=; b=A02M7myfd/Md3XUTg
        /fFD+hBr0J5blEiuvKEjI+US6Tg63Xwhewewq78rTJNd6ixclzvKzUHhFE8Ns/3A
        fANqWvQUNpsWENsTiz9y43EA3oE14U7X/7A/bZm6o26aQvYaWq97Q7IIkC1NJl/K
        EbZGjdwYgEMNdHr6hsz/4yn0+d1pnCqTLe3H/mxc8gXJj2KlNEzsGHQdfy5yE4Yc
        v6b0hOMe3ELi8twOVSt4+iVftI/S431XIAyttDxwRaJC5CmIuM4eNFP1M9bHkVkM
        ObfD5I6h3of3dACSiIKOeyvx0LcMIBgUi9cp2iW5yXzegAfbAJQ+DI/SbYz4U956
        9YoYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=DbreLLCI1Z3Z70YI4GhLwoUgolRQXxKS5uyu6JXhp
        EI=; b=Miml0ien3x1rXxEOVfcK5cpf1VKZr1aDkvTgeptFdFQQzNfPhC8SSRBdK
        fMFTjtpVtxo/uXm02Yf251Z+XLyLCTYVokxF8/r4kkOk4GBFfS/qVkq1IBQG6Kch
        sWv8AUVeK7ZPp8UuPvD5EiJr5OB7sYaT0kazY9eu3awTLASGA0FCJPliTSc8uX+J
        5dX4/MhPPP/ausMGEpYOQMndPUSfPRcOwjjAax5VpySlI/9LHwmXFDiIq1xyKjGu
        PJpknEemJvujG329TbmXcS+lOazyqunwjQr1NUCbfQu0XzWY8Kqt4gI+2UZnKVt2
        Kr0NLpWWMltnFvpI3iiXkHEoxTYKw==
X-ME-Sender: <xms:qfC-YEu5S4Qog4vZ9wm2EnG0zMBqMp99SI1r0W7B_FgSu-IPaBtMeg>
    <xme:qfC-YBdj0X95UZ2Qw0DXCPuIIst3WVh1WshAzuxjVQkZm9MA-yDDgs-Viu9CtYDt_
    uwLfdO5jii1tC6M5g>
X-ME-Received: <xmr:qfC-YPwyws1EbsFE05S69Q4m_W350EU2_ZByhAX0rEmW0G1LADVM_OS0H4n1pBFyfbBORnFSKbxi3BsorIyRaAMcSNH2UbwyBGrAW5OmOdG3Y1PY26TC4cjCiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhephfehgfejveeigfelleejvddujeeihfdukeegjeevhfevtdffudfg
    ueelgeejheeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgr
    mhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:qfC-YHOJseKVqJnyUcZqWy9Rcjep9y7HFcqupBwXtyd92TF8ZjCHOQ>
    <xmx:qfC-YE-cXLOHM5DNhsR9_vVj-Z869F-05AEJM-g-51CYlttF2yqbRg>
    <xmx:qfC-YPUjmK7vWri0VYsg7OVmMo1etCvClgZ96Ih5hhb3GoAR8OHuhQ>
    <xmx:rPC-YIUMThGkWTD07yMigcxCend76zsKNbxnrXzLs8yRqzd2W9bsaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 00:23:05 -0400 (EDT)
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-4-andre.przywara@arm.com>
 <99a2069b-99e9-9b47-12a6-aae01c7f59dc@sholland.org>
 <20210607135910.63560ffc@slackpad.fritz.box>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <56ad752b-b1c2-cb05-be8b-71c29f271ec9@sholland.org>
Date:   Mon, 7 Jun 2021 23:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210607135910.63560ffc@slackpad.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 6/7/21 7:59 AM, Andre Przywara wrote:
> On Thu, 20 May 2021 21:37:34 -0500
> Samuel Holland <samuel@sholland.org> wrote:
> 
> Hi,
> 
>> On 5/19/21 5:41 AM, Andre Przywara wrote:
>>> Add the obvious compatible name to the existing RTC binding.
>>> The actual RTC part of the device uses a different day/month/year
>>> storage scheme, so it's not compatible with the previous devices.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>>> index b1b0ee769b71..178c955f88bf 100644
>>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>>> @@ -26,6 +26,7 @@ properties:
>>>            - const: allwinner,sun50i-a64-rtc
>>>            - const: allwinner,sun8i-h3-rtc
>>>        - const: allwinner,sun50i-h6-rtc
>>> +      - const: allwinner,sun50i-h616-rtc
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -97,7 +98,9 @@ allOf:
>>>        properties:
>>>          compatible:
>>>            contains:
>>> -            const: allwinner,sun50i-h6-rtc
>>> +            enum:
>>> +              - allwinner,sun50i-h6-rtc
>>> +              - allwinner,sun50i-h616-rtc
>>>  
>>>      then:
>>>        properties:
>>>   
>>
>> This binding is missing a clock reference for the pll-periph0-2x input
>> to the 32kHz clock fanout.
> 
> Right. So do I get this correctly that we don't model the OSC24M input
> explicitly so far in the DT? I only see one possible input clock, which
> is for an optional 32K crystal oscillator.
> And this means we need to change some code also? Because at the moment
> a clock specified is assumed to be the 32K OSC, and having this clock
> means we switch to the external 32K OSC.

Right. The code would need updates to follow the binding.

> And who would decide which clock source to use? What would be the
> reason to use PLL_PERIPH(2x) over the RC16M based clock or the
> divided down 24MHz?

Because it would be more accurate. 24MHz/750 == 32000 Hz, while the RTC
expects 32768 Hz.

> So shall we ignore the PLL based input clock for now, put "0 input
> clocks" in the current binding, then later on extend this to allow
> choosing the PLL? And have it that way that having the PLL reference
> means we use it?

No, the device tree represents the hardware, not whatever happens to be
used by Linux drivers at the time. It should be in the binding
regardless of what the driver does with it.

Though the circular dependency between the clock providers does cause
problems. We cannot get a clk_hw for the PLL-based clock, so we would
have to hardcode a global name for it, which means we aren't really
using the device tree.

We already see this "not really using the binding" with the other CCUs:
the H616 CCU hardcodes the name "osc24M", while the A100 CCU hardcodes
"dcxo24M" for the same clock. So moving that clock into the RTC clock
provider would require using both names in one clk_hw simultaneously (or
rather fixing the CCU drivers to get a clk_hw from the DT instead of
referencing by name).

And trying to deal with optional clocks by index is only going to get
more painful over time. For example, with the R329 and D1, the RTC has
the following inputs:
 * DCXO24M (unless you model it inside the RTC)
 * External OSC32k (optional!)
 * The RTC bus gate/reset from the PRCM
 * R-AHB from the PRCM for the RTC SPI clock domain

So it seems time to start using clock-names in the RTC binding.

>> It is also missing a clock reference to the RTC register gate (and that
>> clock is in turn missing from the r_ccu driver).
> 
> Do you mean a gate bit somewhere in the PRCM? Do you have any
> pointer/documentation for that?

Yes, it's bit 0 of PRCM+0x20c, documented in the BSP[1], used in
mainline[2], and verified by experiment.

[1]:
https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-4.9-sun50iw9/drivers/clk/sunxi/clk-sun50iw9.h#L169
[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c#n129

> Cheers,
> Andre

Regards,
Samuel
