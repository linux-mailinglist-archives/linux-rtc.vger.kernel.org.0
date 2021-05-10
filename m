Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC5F377AA5
	for <lists+linux-rtc@lfdr.de>; Mon, 10 May 2021 05:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhEJDkk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 9 May 2021 23:40:40 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34933 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230126AbhEJDkj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 9 May 2021 23:40:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 50D4917C4;
        Sun,  9 May 2021 23:39:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 09 May 2021 23:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=I
        ZUFszC6jE/mtDj0KCiCRll83jCHjDqxXjCZzLBuhwU=; b=lapYcN9ptLh86Cscs
        MMQRNm8UYK3+e08/ShU/GX1v1v9lBEMi3Cew5KOAhtIfOQHzebOdqVUJugyIayKt
        1tV2H1om0IFFvBuH5WKWgZedJw//3R/PqD3g6fJJcgHjoYc3IxdbT22in1BM7/6u
        Q8+plX63zDvHKOr1ycqVQy+xB1cTyvt2jun1klGiP1y55PqsjannHnvb/dM6oKX+
        G1j2OhwN65Z5xeeKRorHRGRdfQ0a6KZUaZsOYpeS3jimJ6x92FQyI3sLQDH1H1YN
        eoSacoJuDzJBmd8yYpvhq8E2pdT10ounLChSE7tbyfZ+rtDwIF+d+STSjWgd1JRv
        UaVkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=IZUFszC6jE/mtDj0KCiCRll83jCHjDqxXjCZzLBuh
        wU=; b=msGzqQU1RGw9+1Txytj0DVNTIs4+ucYxyiQh0ajyDCR1VVX2NNvk8AEsf
        SsoRqMAq79NEvpah5BMJz3COnMo0JtsUe8G7KWofRBP4OcLfG+asv0LFFLFb8NAB
        aT9VThGcrs777j2N5acJp9T1YH7jC78rKplrVcE+/4QfxL1I7ry+JyAbf6rqgYF9
        tdAlHZ+Qa6IAh+bjilqKsw61jkuZB52g2cGuk3yjPdPZk8JmbcXAthkYzJg+MyAf
        wNsjhkvqQaf6Q7D4DUJlZ5wVkBmkKGO7Zv63kcf7YfCjFlu834Q2dvkMVyYVxfXH
        4hIhHNZkzDvtSbcuPjxGTDyN2D8XQ==
X-ME-Sender: <xms:86qYYJ5Xes7seoVw1nxW2DU48Ej89h7LL31TzvkW9X0RUlPHIVSeGQ>
    <xme:86qYYG5ebeZswX0DILnkVoq7doASQ2q62j2CAsorm7wMHk-Xb-PzYeEZcarndEP1r
    GreL_1hFtDr8BrPaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefheenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepheejgefhudeffeetleeigefgheetveeiteeuffehhfffkeeuvdff
    veffveetudefnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:86qYYAdhMMhwf1C5vZjxv4FkWkSQtZyRToqFlvvu0QQRrYsHBag95A>
    <xmx:86qYYCIGHX1PQiaIXxmL_vJrF_tjcEo-OWSoR5rOXdsYu58zCteW9Q>
    <xmx:86qYYNLsebh9pykxyCKk6it0BVX-Tx_ndwhjXYFC14Z7SaJXsBd7dg>
    <xmx:9KqYYF_gxAChs0oEw9tN5THuX4-IR-hv4WeCx8U843GeKU0YBDUfcA>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Sun,  9 May 2021 23:39:31 -0400 (EDT)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210419014549.26900-1-samuel@sholland.org>
 <20210430090206.lybmygrt636nysoc@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
Date:   Sun, 9 May 2021 22:39:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430090206.lybmygrt636nysoc@gilmour>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 4/30/21 4:02 AM, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
>> The sun6i RTC provides 32 bytes of general-purpose data registers.
>> They can be used to save data in the always-on RTC power domain.
>> The registers are writable via 32-bit MMIO accesses only.
>>
>> Expose the region as a NVMEM provider so it can be used by userspace and
>> other drivers.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> As far as I understood, you want to use those registers to implement
> super-standby? If so, while it makes sense for the kernel to be able to
> be able to write to those registers, I guess it would be a bit unwise to
> allow the userspace to access it?

I want the user to be able to pass information to the bootloader (to
select a boot device, e.g. reboot to FEL). I also want the user to be
able to read data stored to these registers by system firmware (e.g.
crust writes exception information there). It's not really related to
standby.

I would want to stack a nvmem-reboot-mode on top to give friendlier
names to some of the numbers, but I don't see a problem with root having
direct access to the registers. It's no different from /dev/nvram
providing access to the PC CMOS RAM.

Regards,
Samuel
