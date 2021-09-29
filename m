Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2ACC41BDC5
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 05:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243828AbhI2D5F (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 23:57:05 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:43713 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243788AbhI2D5F (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 23:57:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9798C580E5F;
        Tue, 28 Sep 2021 23:55:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 28 Sep 2021 23:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=f
        +KFVJLO4WVRmj/HTHjGnTK+KP5rTnlcIHm18veFkRI=; b=m+HXJv6/jdqHeg6Vr
        lPZwV7tYpGmF/eWHXZJrqqXunRbH98Aimzm7PF6g7o7J7gR2+hAbqHPXMsmMCcMd
        GXuU1T5ZoF04NDHtTLMJuiO4ho8+RcCCrB9BRRiKHKw1+6Sjb3uN2XlIF+N50ldr
        t1djvAOlwMMzmpPZPy130gv9HziVBg7Jdb5fBEFzWXml3MkROpzMpqxUxRDVDkd1
        V7xbl6GcYl2mwyWW14WBTgcfK4UzXSooZrCbrlToYfDp/B79iJyOvluZxX/Rvh2t
        22tqHOZoqGvhV80Ll5zDZy5lAntiw64KP0/Z5zDgG9/ExOASkl9bAOwLoFp9yMLR
        im3FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=f+KFVJLO4WVRmj/HTHjGnTK+KP5rTnlcIHm18veFk
        RI=; b=rqtHne48tOJpbGUUmnjX53hsDhMfm8ZQRHdQrGDQPNe/zd3OTMwK1EghK
        ay2HlGnnA8FADp0VASaUsG/wz1vhSAjBhKtSDvFEFrnxbV2yTqqccCARwp/u9em/
        nmwns7Km3JIuvXdWE46vi3xQUSHkpjBz52/31XfGVfalj08OhLByay/j44KZ3mEj
        jaV9qgkikk4eUJbab6y/hXMKqUEcq4QdrvZa5RKT6Q+MPpI+gA5+3/KG7oLcM03k
        4mwiCk/B+dFLlyRts83ZQwkpqa29rJbCL0TXrZbm8+GJgAm5FfnCAzbWxl+L+Q9O
        LswREis7KWPefrv9Sy501GqkC0sQQ==
X-ME-Sender: <xms:rONTYaECJA2UWWfWV57upeU_cHzpVKvfgVp-1Z7xghZBcrgMZEgIeg>
    <xme:rONTYbXgE0UYDnkmUOQGkDWgB8VuqQ-ew4YQOQDBh2-q0y6mXjpSsdCC7isIfFjxf
    kqkVUxZif482zibAg>
X-ME-Received: <xmr:rONTYUKjlVnwsDVPEywzb5hYlS0y2TDQegJy2Ie6hsHqrfsNO4oicnRtBP98MIXoL0J1USwMMg_4dQsGWrF-GGviI3_oqPp8w2Sy0aJ9_oehD7AXaBaU9iCHmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:rONTYUE7H5d2Eqzo4jKRouGBpAWLhCfDnJXCUlAJD6TnooKaCgiwcA>
    <xmx:rONTYQVluKHkdMah2xyT8K7Z6mTsK2HPWAJwumlH9149PzDKk4k5Ag>
    <xmx:rONTYXMdyH31Hs9c_LQHkyrufSfYORWmUdulDeppD9YRWIVa_Kavug>
    <xmx:rONTYRWE-dQ1utt4PqjrNlZUFTTYt3cmCr1yUD1zmJR4SOiJV5KiCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 23:55:23 -0400 (EDT)
Subject: Re: [PATCH v2 2/9] dt-bindings: rtc: sun6i: Add H616, R329, and D1
 support
To:     Rob Herring <robh@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
References: <20210928080335.36706-1-samuel@sholland.org>
 <20210928080335.36706-3-samuel@sholland.org>
 <1632832098.554951.963815.nullmailer@robh.at.kernel.org>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <6ae69109-d26b-f6b5-85a6-4ecca4133dfe@sholland.org>
Date:   Tue, 28 Sep 2021 22:55:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1632832098.554951.963815.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 9/28/21 7:28 AM, Rob Herring wrote:
> On Tue, 28 Sep 2021 03:03:28 -0500, Samuel Holland wrote:
>> These new RTC variants all have a single alarm, like the R40 variant.
>>
>> For the new SoCs, start requiring a complete list of input clocks. The
>> H616 has three required clocks. The R329 also has three required clocks
>> (but one is different), plus an optional crystal oscillator input. The
>> D1 RTC is identical to the one in the R329.
>>
>> And since these new SoCs will have a well-defined output clock order as
>> well, they do not need the clock-output-names property.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>> Changes since v1:
>>   - Properly update the DT binding clocks and clock-names properties.
>>
>>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 72 ++++++++++++++++++-
>>  include/dt-bindings/clock/sun6i-rtc.h         | 10 +++
>>  2 files changed, 79 insertions(+), 3 deletions(-)
>>  create mode 100644 include/dt-bindings/clock/sun6i-rtc.h
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:122:9: [error] duplication of key "minItems" in mapping (key-duplicates)
> ./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:150:9: [error] duplication of key "minItems" in mapping (key-duplicates)

Whoops, I have a couple of minItems where I meant maxItems. Sorry, will
fix for v3.

Samuel
