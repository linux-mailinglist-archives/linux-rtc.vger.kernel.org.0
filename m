Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E20145A68
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 17:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgAVQ6B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 11:58:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35672 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725989AbgAVQ6B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 11:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579712280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cYbmOpLAHnijzwZ6a1KFHHQ4Xw2Q89q6HmNxrmLFSrU=;
        b=ayOKSiXvAbwfZ+Ege6TBTiwOYZ9xfip0FUGAh3Uc8+oeXoeVSHM132HcsOG1J9mvxLhlWh
        WsAKDAPHQSMWLkK3zDmlEmbG4ACcOdFaQhr2TjAJx5jtn783em4Wu489imSJIJOjkHsI+c
        fKCQ1yfyNl2zDGy3NuWcsegk0sLYYO4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-Ls1vTrZRM0Koll_hEqrm4g-1; Wed, 22 Jan 2020 11:57:58 -0500
X-MC-Unique: Ls1vTrZRM0Koll_hEqrm4g-1
Received: by mail-wr1-f70.google.com with SMTP id d8so133753wrq.12
        for <linux-rtc@vger.kernel.org>; Wed, 22 Jan 2020 08:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cYbmOpLAHnijzwZ6a1KFHHQ4Xw2Q89q6HmNxrmLFSrU=;
        b=PFi1hFk/f9aCL5ZpI1B8UFDDD6GVOz4JyVjSPHyJ4aKSDmpDRc8fLAY8KVYrpXvmZL
         g4Umkv8rXjN7N3a3ytfM8Ngq8tMAkVqpWUK/96JuQaPPuGDX3nYdSzcA3W2YngMebSG7
         V162b1PrFSsxAeDJSvFrXAReAjQcLd8mK5arzODHGMqtiVTthOAAeUdEBff/MHHJPMHM
         eFleXJcPDyesFSwM0Pf2GHsFkpVOjsO1FaUhH9hUjfxdLvUsF/WLUK+jz+I7SmRL3629
         xsxaWiWaew0G9wxXB8RZ3lwow6mnSVYIdZMKvWXyFYvVLDIpzGFe+6euy+i5PZvMGzdo
         PwjA==
X-Gm-Message-State: APjAAAVBSO/xNHTAss0jsTImaQtii114tF0WTOgwX8CeF/Bx+si5JZ3i
        6YabWRyvAdG+RZYjljgXsQHoYrvVHhFsIgzDsT+DztkjlptNo6W4KvR6XeDRVMcNjTepkfyMQsE
        8B/T4mNt7eocvh3HEepYN
X-Received: by 2002:adf:82a7:: with SMTP id 36mr12474101wrc.203.1579712276473;
        Wed, 22 Jan 2020 08:57:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwolaHRfKZa3v5bqBXlKKoJ9J5txL8bQ9CRyGugyEO7/sqh28M05w+phGCSjWUXoqUcfrcuYA==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr12474080wrc.203.1579712276264;
        Wed, 22 Jan 2020 08:57:56 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id j12sm62744701wrw.54.2020.01.22.08.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 08:57:55 -0800 (PST)
Subject: Re: [PATCH v1 1/3] rtc: cmos: Stop using shared IRQ
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <da739456-0177-355c-754b-55cdd3654bfe@redhat.com>
Date:   Wed, 22 Jan 2020 17:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 22-01-2020 15:45, Andy Shevchenko wrote:
> As reported by Guilherme G. Piccoli:
> 
> --- 8< --- 8< ---
> 
> The rtc-cmos interrupt setting was changed in the commit 079062b28fb4
> ("rtc: cmos: prevent kernel warning on IRQ flags mismatch") in order
> to allow shared interrupts; according to that commit's description,
> some machine got kernel warnings due to the interrupt line being shared
> between rtc-cmos and other hardware, and rtc-cmos didn't allow IRQ sharing
> that time.
> 
> After the aforementioned commit though it was observed a huge increase
> in lost HPET interrupts in some systems, observed through the following
> kernel message:
> 
> [...] hpet1: lost 35 rtc interrupts
> 
> After investigation, it was narrowed down to the shared interrupts
> usage when having the kernel option "irqpoll" enabled. In this case,
> all IRQ handlers are called for non-timer interrupts, if such handlers
> are setup in shared IRQ lines. The rtc-cmos IRQ handler could be set to
> hpet_rtc_interrupt(), which will produce the kernel "lost interrupts"
> message after doing work - lots of readl/writel to HPET registers, which
> are known to be slow.
> 
> Although "irqpoll" is not a default kernel option, it's used in some contexts,
> one being the kdump kernel (which is an already "impaired" kernel usually
> running with 1 CPU available), so the performance burden could be considerable.
> Also, the same issue would happen (in a shorter extent though) when using
> "irqfixup" kernel option.
> 
> In a quick experiment, a virtual machine with uptime of 2 minutes produced
>> 300 calls to hpet_rtc_interrupt() when "irqpoll" was set, whereas without
> sharing interrupts this number reduced to 1 interrupt. Machines with more
> hardware than a VM should generate even more unnecessary HPET interrupts
> in this scenario.
> 
> --- 8< --- 8< ---
> 
> After looking into the rtc-cmos driver history and DSDT table from
> the Microsoft Surface 3, we may notice that Hans de Goede submitted
> a correct fix (see dependency below). Thus, we simply revert
> the culprit commit.
> 
> Fixes: 079062b28fb4 ("rtc: cmos: prevent kernel warning on IRQ flags mismatch")
> Depends-on: a1e23a42f1bd ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")
> Reported-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Entire series looks good to me:

Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   drivers/rtc/rtc-cmos.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 033303708c8b..cb28bbdc9e17 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -850,7 +850,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>   			rtc_cmos_int_handler = cmos_interrupt;
>   
>   		retval = request_irq(rtc_irq, rtc_cmos_int_handler,
> -				IRQF_SHARED, dev_name(&cmos_rtc.rtc->dev),
> +				0, dev_name(&cmos_rtc.rtc->dev),
>   				cmos_rtc.rtc);
>   		if (retval < 0) {
>   			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
> 

