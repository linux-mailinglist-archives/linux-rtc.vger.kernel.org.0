Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B4E140774
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 11:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729224AbgAQKJY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 05:09:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:40344 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729304AbgAQKJV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jan 2020 05:09:21 -0500
Received: from mail-qv1-f72.google.com ([209.85.219.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1isOZ5-0002BL-IT
        for linux-rtc@vger.kernel.org; Fri, 17 Jan 2020 10:09:19 +0000
Received: by mail-qv1-f72.google.com with SMTP id z12so15362030qvk.14
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jan 2020 02:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=L2UnW81Vu3XD2b1gwLCWx2uumOKxr3uuXM1IWBSKCQg=;
        b=j9zIziIL5KHGjNj1aXPaycla1xQ0KQhaRUuZIUqgtiyKhSzKyXTBo2JH1Bg2z/1jlT
         wI8WZFXCHjAx7t601IH5u6Pyt0FOa/Ra6Zg49mVwLxd8IzGfDg5ctEI96i4YQj0RCl+d
         Snsm2st2A9jCmeyerGyhC16egGJesBKnxszcAHAU5G3y/TXxuXNHTpQnMpTsbG31Yab3
         sK3S5yAPg2/zGaq0YZZwBecNdzEy1X50ynJW0KaqTzwo1VTdr9SF4cXvVOyt35GNxe+s
         7y/01zlHGx4aZ6FxWOLvyUH5Ndr2gybiV2Hyek3L1rmRKLKoI0eQ2yoRto3IFGlBoUfw
         bQ1w==
X-Gm-Message-State: APjAAAWlU/qtin4NhI7ac3Pf/pKnI0Qrlolei3b093xzr4Vg6Azg4f4N
        dlZB8TqtcVfc6UhjzTTfu0anvWOlD3oVpWW0LbWg07c6eWPRchuSrUDx2ClsR/BGJRBlfKJXyIY
        ilBWiN8td0rTos94Jz33k7FxF0Q0C895GXba1eQ==
X-Received: by 2002:a37:84a:: with SMTP id 71mr36074672qki.138.1579255758740;
        Fri, 17 Jan 2020 02:09:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzo2VTw2l+cGB+lLhlkHh2hSinQ/BWf9DtLhL/7/SpkID/cdVxPOuQO2iPAoVr34+mnT7NMEQ==
X-Received: by 2002:a37:84a:: with SMTP id 71mr36074657qki.138.1579255758538;
        Fri, 17 Jan 2020 02:09:18 -0800 (PST)
Received: from [192.168.1.75] ([152.254.147.47])
        by smtp.gmail.com with ESMTPSA id n20sm11230535qkk.54.2020.01.17.02.09.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2020 02:09:17 -0800 (PST)
Subject: Re: [PATCH] rtc: cmos: Don't enable shared interrupts if using
 HPET-based IRQ handler
To:     Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, kernel@gpiccoli.net,
        gpiccoli@canonical.com
References: <20200103140240.6507-1-gpiccoli@canonical.com>
 <20200108174111.GD32742@smile.fi.intel.com>
 <87h815ybxo.fsf@nanos.tec.linutronix.de>
 <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
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
Message-ID: <9b04b099-0495-d188-7002-cad1147b61d0@canonical.com>
Date:   Fri, 17 Jan 2020 07:09:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4882eca9-c5dd-a37c-bc13-14108300fd92@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi all, do we have any news about this one?
Thanks in advance,


Guilherme
