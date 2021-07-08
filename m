Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC55D3BF5E6
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jul 2021 09:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhGHHF3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Jul 2021 03:05:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59097 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhGHHF3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Jul 2021 03:05:29 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1m1O3b-00065R-6D
        for linux-rtc@vger.kernel.org; Thu, 08 Jul 2021 07:02:47 +0000
Received: by mail-wm1-f69.google.com with SMTP id h4-20020a05600c3504b02902190c4d3d18so230288wmq.8
        for <linux-rtc@vger.kernel.org>; Thu, 08 Jul 2021 00:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3f6AjuDr9DREq/BYb5H9OJJObGL5I+SYWgZP05BzVcc=;
        b=r71EbEMhePXSzvxGA66mWC9tfz+mUamWQ/8qKKuk/nf9H46uG8nIhjeD4ws+6hDiy6
         c1Ws2rMPyhuFXY5I58dtD59rj1ud3zsjwa5AOK7Gt9gguNS2elVUylmOWQEN5rnZ1244
         eiXy5E3ussljRY3Ra44NXaBU56OaELXlypoD8fyBwxKOOkzxk10spIPDqRoo2LEauvWm
         B3iUbLxBv+Vu33Q3DMTu4Qw71Ql+YElzvQTcG6bV+A7xLpnqW4z7DrTRY/TVo1rbDRDD
         oiR7IzgBslY9VGvUvGBfQI2xqyIEvJf75ge1NcDCqFCqVZvAVH2Qfraz9bk30oTk77rR
         aO5Q==
X-Gm-Message-State: AOAM532NXkIuvkETR9JoKugyUfOKWOjTJTXVnVeGNfD9sAuh2pFvDfv1
        7jRNdzZTPziUXUlzdp7Lok3pb+HRhzaHdJMYhwzu+KdAUyuXcik96ZoLkOwaxHbWsDNMPU5xiFh
        oLRm4a7zsIexgBS061ETMxa8QXp2W5fV7s6X1aQ==
X-Received: by 2002:a05:600c:3644:: with SMTP id y4mr3525069wmq.85.1625727767000;
        Thu, 08 Jul 2021 00:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/hWFlccAvYQ22p30X1RqIfOvCiR1jNxi8oOhZT6XSobV1yvvN4f5f+DV9uS9QzoXy2W9Cuw==
X-Received: by 2002:a05:600c:3644:: with SMTP id y4mr3525047wmq.85.1625727766822;
        Thu, 08 Jul 2021 00:02:46 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id p15sm1025526wmq.43.2021.07.08.00.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 00:02:46 -0700 (PDT)
Subject: Re: [PATCH] rtc: s5m: Check return value of
 s5m_check_peding_alarm_interrupt()
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
References: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b584f0b3-9f2b-761d-6c33-8ebdab9f1120@canonical.com>
Date:   Thu, 8 Jul 2021 09:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/07/2021 07:13, Nobuhiro Iwamatsu wrote:
> s5m_check_peding_alarm_interrupt() in s5m_rtc_read_alarm() gets the return
> value, but doesn't use it.
> This modifies using the s5m_check_peding_alarm_interrupt()"s return value

Avoid "This ..." type of sentences and use simple imperative:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

> as the s5m_rtc_read_alarm()'s return value.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  drivers/rtc/rtc-s5m.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
