Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7DE145A6D
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 17:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgAVQ6z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 11:58:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50791 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726083AbgAVQ6y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 11:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579712333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KULiQn2HtM061cEp0p3UGFhwT+beLJlhb+zpU3q+cg0=;
        b=GFGQeqn1s1QvnqBWjSiiZmBPyh2qSun4cMN9jN1/KlhXDTlhUk4N7aWVHQmibzMIl2EFaR
        35lTrzkHctTkkgyxuQywvFju/7KSE/afSRFF/8Z9wbKKouZAzQwxQtenuksANrrhOyrkHX
        PjOjh/T3aun/bjU7omDbVGEAThZh4l4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-o1fFrExZN5ezhsP_eaAZcA-1; Wed, 22 Jan 2020 11:58:51 -0500
X-MC-Unique: o1fFrExZN5ezhsP_eaAZcA-1
Received: by mail-wm1-f69.google.com with SMTP id c4so130307wmb.8
        for <linux-rtc@vger.kernel.org>; Wed, 22 Jan 2020 08:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KULiQn2HtM061cEp0p3UGFhwT+beLJlhb+zpU3q+cg0=;
        b=qt91ld9pgKis9wy9D8F0apgc+3NY7lXKTzpVWl+l6OD1B5lUzHWYlfvCsCl/OzL49o
         IL9op/2TGxPBb/KHPnSHffNscyyDz4sxq1mA9MjyVw657BtfxjSE48i+Zcb74X+hadzK
         Pd2XNX85lheoQVebyonHtyVVrVjtCFX8YChP67p8/Q5QPdcRIBI2hrzPD8vztJTiT2a5
         nnN9k6q4xuyvRiZKCUalrLzdM2pHxLxZwa1eZpDW6fauJ2vlodsps8MRHZGE9ucYHdbP
         7hmUfkR/nIeM7ONTAbYVpBLiZor9UsFJkgMIbIQc0xZp8rnrj37s+r+HgwFYwq5bH/7p
         9dhA==
X-Gm-Message-State: APjAAAWo7jtVeSxq0aFUCIkLIAlouWt/oOvSOTF5nVJuqbG+seLSfyxT
        XQrX13N/mJla4FK0UXYQBXo8SYTHtr6dIEDxLNCOnLkybvnJoJjc4/MURRai/vc0BJ7yDJRGNXh
        PLcNla3Dz5godeL7Br14v
X-Received: by 2002:a05:6000:1142:: with SMTP id d2mr12138848wrx.253.1579712330621;
        Wed, 22 Jan 2020 08:58:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtpkIZStDPuhvNyls/GSHuPca4dgE0FciWtelZKj0/GMB/PW9yfeb5W0ByP9OSFMTmKeKyJw==
X-Received: by 2002:a05:6000:1142:: with SMTP id d2mr12138831wrx.253.1579712330391;
        Wed, 22 Jan 2020 08:58:50 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id e18sm58349350wrr.95.2020.01.22.08.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 08:58:49 -0800 (PST)
Subject: Re: [PATCH v1 1/3] rtc: cmos: Stop using shared IRQ
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
 <da739456-0177-355c-754b-55cdd3654bfe@redhat.com>
Message-ID: <a92c960f-1129-52b0-02bd-b3824c678cb2@redhat.com>
Date:   Wed, 22 Jan 2020 17:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <da739456-0177-355c-754b-55cdd3654bfe@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 22-01-2020 17:57, Hans de Goede wrote:
> Hi,
> 
> On 22-01-2020 15:45, Andy Shevchenko wrote:
>> As reported by Guilherme G. Piccoli:
>>
>> --- 8< --- 8< ---
>>
>> The rtc-cmos interrupt setting was changed in the commit 079062b28fb4
>> ("rtc: cmos: prevent kernel warning on IRQ flags mismatch") in order
>> to allow shared interrupts; according to that commit's description,
>> some machine got kernel warnings due to the interrupt line being shared
>> between rtc-cmos and other hardware, and rtc-cmos didn't allow IRQ sharing
>> that time.
>>
>> After the aforementioned commit though it was observed a huge increase
>> in lost HPET interrupts in some systems, observed through the following
>> kernel message:
>>
>> [...] hpet1: lost 35 rtc interrupts
>>
>> After investigation, it was narrowed down to the shared interrupts
>> usage when having the kernel option "irqpoll" enabled. In this case,
>> all IRQ handlers are called for non-timer interrupts, if such handlers
>> are setup in shared IRQ lines. The rtc-cmos IRQ handler could be set to
>> hpet_rtc_interrupt(), which will produce the kernel "lost interrupts"
>> message after doing work - lots of readl/writel to HPET registers, which
>> are known to be slow.
>>
>> Although "irqpoll" is not a default kernel option, it's used in some contexts,
>> one being the kdump kernel (which is an already "impaired" kernel usually
>> running with 1 CPU available), so the performance burden could be considerable.
>> Also, the same issue would happen (in a shorter extent though) when using
>> "irqfixup" kernel option.
>>
>> In a quick experiment, a virtual machine with uptime of 2 minutes produced
>>> 300 calls to hpet_rtc_interrupt() when "irqpoll" was set, whereas without
>> sharing interrupts this number reduced to 1 interrupt. Machines with more
>> hardware than a VM should generate even more unnecessary HPET interrupts
>> in this scenario.
>>
>> --- 8< --- 8< ---
>>
>> After looking into the rtc-cmos driver history and DSDT table from
>> the Microsoft Surface 3, we may notice that Hans de Goede submitted
>> a correct fix (see dependency below). Thus, we simply revert
>> the culprit commit.
>>
>> Fixes: 079062b28fb4 ("rtc: cmos: prevent kernel warning on IRQ flags mismatch")
>> Depends-on: a1e23a42f1bd ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")
>> Reported-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Entire series looks good to me:
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

That should have been:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Of course, sorry.

Regards,

Hans


>> ---
>>   drivers/rtc/rtc-cmos.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
>> index 033303708c8b..cb28bbdc9e17 100644
>> --- a/drivers/rtc/rtc-cmos.c
>> +++ b/drivers/rtc/rtc-cmos.c
>> @@ -850,7 +850,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>>               rtc_cmos_int_handler = cmos_interrupt;
>>           retval = request_irq(rtc_irq, rtc_cmos_int_handler,
>> -                IRQF_SHARED, dev_name(&cmos_rtc.rtc->dev),
>> +                0, dev_name(&cmos_rtc.rtc->dev),
>>                   cmos_rtc.rtc);
>>           if (retval < 0) {
>>               dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
>>

