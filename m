Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27CB7136026
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2020 19:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgAIS11 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Jan 2020 13:27:27 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51275 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgAIS11 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Jan 2020 13:27:27 -0500
Received: from mail-qk1-f200.google.com ([209.85.222.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1ipcWh-0002Ai-Hv
        for linux-rtc@vger.kernel.org; Thu, 09 Jan 2020 18:27:24 +0000
Received: by mail-qk1-f200.google.com with SMTP id 24so4681165qka.16
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jan 2020 10:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HBU2uio6GhC4k3gq7MvNQXobJuZHITojVEeSq8ZUqCY=;
        b=R+qrCEsHZzjUKacKgYhn2IpR5aWXdeN/R4DuAmzx1vHPGLSk1RMq3IJGIg5xdupbIa
         lwn4psNgpTAZBIOqn85TVedQpv3vZOGgvzNoMs29/KKLs711Kme9v8Ykmjj6gRpVuQy2
         j886Apuj9W+oDg+ewnh0EQJA3+J2sY9q/fpmSiYIC5YqX68Cpc+/xV7b4O1JNpf+ZizQ
         3eY4RoN0k3T5Nb8sYEJ52a+1xZWmmImw7Nanilc/GW5ihAewCqFiJAh/5/EL+M04gR1R
         0v7uTLVWAqHGJ7XGikqKTuqhSZLinrF7+lydF/zH5bYIODDLXomnVUjdslzJ9GY8g2G7
         qXVQ==
X-Gm-Message-State: APjAAAUIMWcJPcp65jO0Vmm2zShK6ZHm4vT6LVyqHz4AL21vutf13uu1
        /mcpmViaOL9CJ45vvwuc3H2tiztth4ho0dWbXkDQ3eC0EhSO9t5zdjEX8BQIm3DHNtwhXv36Vif
        FzsKZw9WVKnRZ773woJq0yebPfzOqjVfzEisoKA==
X-Received: by 2002:ac8:24c1:: with SMTP id t1mr9138987qtt.257.1578594442318;
        Thu, 09 Jan 2020 10:27:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3ZOjmTGXH6BghiMe2HHEkahh8x6Pz1wCI2qa15frAlmlJoYfjxKKMvkV74WUFk8C2maE2SA==
X-Received: by 2002:ac8:24c1:: with SMTP id t1mr9138969qtt.257.1578594442065;
        Thu, 09 Jan 2020 10:27:22 -0800 (PST)
Received: from [192.168.1.75] ([187.116.99.245])
        by smtp.gmail.com with ESMTPSA id g18sm3392287qki.13.2020.01.09.10.27.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jan 2020 10:27:21 -0800 (PST)
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
To:     Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, kernel@gpiccoli.net,
        gpiccoli@canonical.com
References: <20200103140240.6507-1-gpiccoli@canonical.com>
 <20200108174111.GD32742@smile.fi.intel.com>
 <87h815ybxo.fsf@nanos.tec.linutronix.de>
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
Message-ID: <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
Date:   Thu, 9 Jan 2020 15:27:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87h815ybxo.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/01/2020 16:40, Thomas Gleixner wrote:
>> [...]
>> I think you may ask for Thomas' opinion (Cc'ed now).
> 
> I'm a bit wary with binding this to the fact that the HPET is
> involved.
> 
> Especially I don't know whether the Surface3 which is Intel based
> exposes the HPET via ACPI which would pretty much revert the effect of
> the mentioned commit which introduced the IRQF_SHARED magic especially
> for Surface3.
> 
> As this is a Surface3 specific misfeature, it might be trivial enough to
> set IRQF_SHARED based on a DMI quirk for the Surface3.
> 
> Thanks,
> 
>         tglx

Thanks Andy and Thomas for the discussion.
If I understood correctly, Thomas' opinion is that we shouldn't keep the
IRQ flag as shared and instead pursue a device's quirk for Surface3 in
order of making IRQs shared only in such laptop - correct?

In that case, shall we revert that commit entirely (I can respin the
patch fixing the description and reverting, if that's the case), or this
version (HPET-restricted) is enough?

I don't have a Surface 3 on hands, if anybody can provide SMBIOS data
from it, I can also take a look on quirking it to keep the shared IRQs.

Cheers,


Guilherme
