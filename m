Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D4441B0EB
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 15:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241439AbhI1Ngu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 09:36:50 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:44766
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241533AbhI1Ngd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 09:36:33 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 16CDC40CEE;
        Tue, 28 Sep 2021 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632836090;
        bh=LthWjnlRqwPVsS/SaAlB15xuPGLGuLfciTawY1djQSY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=rjtC0iVxro3HDDb+ajvexNya1mRfJj0n7ePicasiTxDHVlsEnB+eJxugdJFHJDdN+
         wnayh9SkmpmSOHAHlK9tGX3iuAXOuVW+gQBIstMINUfwtPDbUyit+fwaWW9pB9SWXS
         LZDOhyQLvKd2ktLsY2b6AzyhOQeBNzr5/BL+UFulSWWoDiZM8ANJRuhNEyKkbKs39G
         my6YrA3JXSXCCdIlOqs9OwlN+NplKaKBYKDuhgTbhSW3QXeIJ0J8NMfqqCGlGasvB8
         5LYmkXNN5uhiaD0brBhx28+jbhc/mQM7yUuQay+6Q0H0A0TIEiiFWewPmAkqTotz/X
         aJisN56dq9mWw==
Subject: Re: [PATCH][next] rtc: msc313: Fix unintentional sign extension issue
 on left shift of a u16
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210928123906.988813-1-colin.king@canonical.com>
 <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <8f21ec82-201d-efee-d1db-382a7885d38f@canonical.com>
Date:   Tue, 28 Sep 2021 14:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFr9PXnMXPmuaUnfr-VwaZDX1hY8ZDtp1+UxOau6DKpUP9FdzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/09/2021 14:31, Daniel Palmer wrote:
> Hi Colin,
> 
> On Tue, 28 Sept 2021 at 21:39, Colin King <colin.king@canonical.com> wrote:
>> Shifting the u16 value returned by readw by 16 bits to the left
>> will be promoted to a 32 bit signed int and then sign-extended
>> to an unsigned long. If the top bit of the readw is set then
>> the shifted value will be sign extended and the top 32 bits of
>> the result will be set.
> 
> Ah,.. C is fun in all the wrong places. :)
> These chips are full of 32bit registers that are split into two 16
> registers 4 bytes apart when seen from the ARM CPU so we probably have
> this same mistake in a few other places.
> 
> A similar pattern is used a bit later on in the same file to read the counter:
> 
> seconds = readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
> | (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);

Ah, I missed that one! I'll send a V2.

> 
> I guess it works at the moment because the top bit won't be set until 2038.

I hope to be retired by then, but I guess fixing it up before 2038 is a
good idea ;-)

> 
> Thanks,
> 
> Daniel
> 

