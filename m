Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122323925E1
	for <lists+linux-rtc@lfdr.de>; Thu, 27 May 2021 06:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbhE0EKq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 May 2021 00:10:46 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43331 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229836AbhE0EKq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 May 2021 00:10:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 724BD5C008C;
        Thu, 27 May 2021 00:09:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 27 May 2021 00:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=F
        le4QsL0suhBg+31Rp9XpR54QEn82lcPFK4WnOHC9y4=; b=E5n39DFlE9DPPrm5d
        fqb+MXTvx1ky93KmhWbOEApEnlCLpN4gjsjD0vh1LUKsWv6xVyrFC+F8pF0miVqf
        lPRKF0dP3DiACFVBM/IBGcy5/9sejRb5dPmTxArjtdqVGqa2pMrhBGdbp4Gkq16H
        FsJ6UvHK7DPuARTaRmdHPiUjgGyTvQB2XRgHBnLfsDTDW/+gS8s+6hoQs3SxVd3l
        3CXfIkPcQNqMBXTbPTJfR1ZLs4fD/fRaA3zN1Wrumpn7RxhYwyvcTe6+/oZhRqqq
        HP5eHCYb51ixHERmADlIkXiqKc47E1lJUlTwl/8plajyzLZjXJhmpChhCcrUpkwd
        OEyRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Fle4QsL0suhBg+31Rp9XpR54QEn82lcPFK4WnOHC9
        y4=; b=K0MzeTldCxqdNn5dAZz/PBmcUldQmPxWg7FasuY4W0WbbHZlNT9BjQesj
        veO3jYgU0BzgPP8ubyJ+6hdjXINOZ9tZBhAE5U1NDZSxBORNDH4BoBw6baJM61wA
        lyKifXqYlBhq8nh5HpxDDitCYGHSkBhmVRHlkesGWcItr8g6f+mYO4UqtRiFQ5rL
        K0QTZDiXh3gwRruhwWCQ2Ghj7kLfIv6GsghBYIb6VQFVQxDAR/e7Gg8ZKpDBPMHP
        1SSr1CBqYaFa7LYgqu356QYSahGcnQcApeRA4RJBQCR5iKIKhfGjGrrQ0p6EsXEF
        m24UJWGXeKs7gzVHj5rKuMq8LtsKA==
X-ME-Sender: <xms:ZhuvYJh0cr5L9dmOKvA4LUvKZ8AYlZEhBGYnqXWUc6lc2uU24JIkqg>
    <xme:ZhuvYOBQkn_D-Sr4nz3AVvaJkBXEkNaVsvWR6TiKq5whHnqZDcUcrkXDJdxcNOcdI
    P6-2CYU06d0Eg5Rjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefheenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepheejgefhudeffeetleeigefgheetveeiteeuffehhfffkeeuvdff
    veffveetudefnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:ZhuvYJEH1ouC1CrDnyhi6q23cij5S8c0tepDO1yLgofBZ7Dws17Y9w>
    <xmx:ZhuvYOTqfNH7Gd80DFGV7t_xsTIS6f4MhB9dpaTuHdCoMh8bnXFrcA>
    <xmx:ZhuvYGyfrOskCwKCmFfQ1s3DsvdIaROUdmzT9Y_DTULfrKIfYhRX-A>
    <xmx:aBuvYNkvRsC6w3DZXXck-U2jzve_5NKEtmG0jOtUtTK3BgqsGdNU-A>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu, 27 May 2021 00:09:10 -0400 (EDT)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210419014549.26900-1-samuel@sholland.org>
 <20210430090206.lybmygrt636nysoc@gilmour>
 <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
 <20210525082416.jkqmlkbdx6nhrens@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <70366b7a-f8e2-abaf-682b-998094095f59@sholland.org>
Date:   Wed, 26 May 2021 23:09:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525082416.jkqmlkbdx6nhrens@gilmour>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 5/25/21 3:24 AM, Maxime Ripard wrote:
> On Sun, May 09, 2021 at 10:39:30PM -0500, Samuel Holland wrote:
>> On 4/30/21 4:02 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
>>>> The sun6i RTC provides 32 bytes of general-purpose data registers.
>>>> They can be used to save data in the always-on RTC power domain.
>>>> The registers are writable via 32-bit MMIO accesses only.
>>>>
>>>> Expose the region as a NVMEM provider so it can be used by userspace and
>>>> other drivers.
>>>>
>>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>>
>>> As far as I understood, you want to use those registers to implement
>>> super-standby? If so, while it makes sense for the kernel to be able to
>>> be able to write to those registers, I guess it would be a bit unwise to
>>> allow the userspace to access it?
>>
>> I want the user to be able to pass information to the bootloader (to
>> select a boot device, e.g. reboot to FEL). I also want the user to be
>> able to read data stored to these registers by system firmware (e.g.
>> crust writes exception information there). It's not really related to
>> standby.
> 
> What information do you want to provide? This looks like punching
> through the abstraction layer provided by the kernel.

I don't see how registering an NVMEM provider is punching through any
abstraction layer. NVMEM _is_ the relevant abstraction layer provided by
the kernel. What else would you suggest I use?

> This is also an issue since it ties an ABI to the use of crust: if
> there's another user for those RTC registers at some point, the
> userspace would have no way to tell whether or not crust is being
> used and might get complete garbage (compared to what crust usually
> provides) instead.

If the user chooses to interact with the NVMEM via sysfs, then the user
has to deal with the consequences. This is equivalent to the user's
responsibility when using, for example, /dev/mem or libusb.

For the purpose of providing the abstraction, the actual data stored
there is irrelevant. And if you want to partition up the registers to
reserve for different users, that is what NVMEM cells accomplish.

>> I would want to stack a nvmem-reboot-mode on top to give friendlier
>> names to some of the numbers, but I don't see a problem with root having
>> direct access to the registers. It's no different from /dev/nvram
>> providing access to the PC CMOS RAM.
> 
> And those solutions have issues too. efivarfs for example can totally
> brick the system it runs on if the user has an unfortunate rm -rf.

The sun6i RTC, like PC CMOS, is battery-backed RAM. efivarfs writes to
flash. The magnitude of any such "danger" is vastly different between
the two. (And I think we can do better than vendors who release those
brickable EFI implementations.)

Regards,
Samuel
