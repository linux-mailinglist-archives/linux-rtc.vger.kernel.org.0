Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9FB1456BA
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 14:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgAVN3Z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 08:29:25 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:40608 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730898AbgAVN11 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 08:27:27 -0500
Received: from mail-qk1-f199.google.com ([209.85.222.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1iuG2X-0001Kd-6I
        for linux-rtc@vger.kernel.org; Wed, 22 Jan 2020 13:27:25 +0000
Received: by mail-qk1-f199.google.com with SMTP id i135so3897820qke.14
        for <linux-rtc@vger.kernel.org>; Wed, 22 Jan 2020 05:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CmaQO4FF+K7/iCzZDLlvuA/B0evBkX3VDhwqEZW+toY=;
        b=Jn8v2w26LGFWAiuKetUAMoXOQRvRFNV31o/24+INgTuPj++fUaiCvvjl7LYtbJ4eOr
         //gjaMmvACk3Af2VGRnKSF++dFpHT2yidM4fq3MNeTpcbaY7nfonrHNnv1LAr2dUlHvD
         nWSveNOotLoFt9xWa+WNXVg3oAB0UUZ8RGggJB8pYHZ1dHAxfGa2l3ViImMKQMzpgi0o
         exYOCKyXklyTI+Tg6LEu0nrF4P91cPUu/GlELbt6tJOXR2YtbWUE3AGLsuj38Ot5OOZ+
         f7iRkf4xB/kDGNvyJz1+XvEruDuPWhn47mbrqm7PisVxwSW9ZyH/klENL8gdnB1IZq8U
         ORQg==
X-Gm-Message-State: APjAAAW+Xnj68BCbj/3XEUTLXXhCrrwnbDM86qoh8AFiyITDNgnKYK3f
        Kta6IdajsKaKMOtHMUYBX1fKZ8CwnbDbwRuleNUoVWCxAMeifgfjWQVAkdRD33WQDibOK4eGUAD
        1ci448v8NOZQqKJTB1KgwLv0yFhJa7bL1wM/2+w==
X-Received: by 2002:ac8:35b9:: with SMTP id k54mr5270948qtb.107.1579699644026;
        Wed, 22 Jan 2020 05:27:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwePMUE409ZObygP4xGWthfnKdt9e+6/sID2BuWcwKcDiHwbG3qLjZlFT8M8PWUIfo1DzgV2Q==
X-Received: by 2002:ac8:35b9:: with SMTP id k54mr5270920qtb.107.1579699643744;
        Wed, 22 Jan 2020 05:27:23 -0800 (PST)
Received: from [192.168.1.75] ([179.98.46.48])
        by smtp.gmail.com with ESMTPSA id k17sm2167932qkj.71.2020.01.22.05.27.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jan 2020 05:27:23 -0800 (PST)
Subject: Re: [PATCH v1 1/8] rtc: cmos: Use shared IRQ only for Microsoft
 Surface 3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-rtc@vger.kernel.org
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
 mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
 Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
 30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
 irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
 7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
 AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
 AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
 5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
 4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
 q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
 iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
 LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
 aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
 pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
 kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
 nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
 bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
 BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
 1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
 egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
 Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
 kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
 X18zwLgdiQ==
Message-ID: <a4a30d2e-b7eb-0f2e-933d-97f5bb006428@canonical.com>
Date:   Wed, 22 Jan 2020 10:27:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/01/2020 14:56, Andy Shevchenko wrote:
> As reported by Guilherme:
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
> This patch changes this behavior by preventing shared interrupts for
> everything, but Microsoft Surface 3 as stated in the culprit commit message.
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
> Fixes: 079062b28fb4 ("rtc: cmos: prevent kernel warning on IRQ flags mismatch")
> Reported-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Andy, thanks for the great patch! It works for me, I've tested it on top
of 5.5-rc7, no more RTC lost interrupts while using the "irqpoll"
parameter. So, feel free to add my:

Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Cheers,


Guilherme
