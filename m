Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F85429FDA
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 10:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbhJLIcC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 04:32:02 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39958
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235064AbhJLIbr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 04:31:47 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AA48A40012
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634027383;
        bh=iGpGmbwC/XUGzipXWdmzUImvvrSqMI37QUV5/5ZOdKM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=omCs2kMoDeve3ZNMbTSGim0PYB7WBLJKHLWvMNEwMq3d0kEwaEWwEYyZmdGF6BK06
         QkLh3YTcO0J4suRSsKpyccbCxN3yVYuRAya/ZZAinbcjvZBmNz//gutJmbVG+gM8iF
         8h65BKIFC252sMJRn/h+nszpD2ZU5QtmNBYNpsA7tAanHnBDkZuKNYgCa7AR8QwzLS
         OkrYh/kaewNEiZsUPHNI/IhMK/AyT2Rphs38Juc80C+bvp6uFhKbydjnkht1EdHb41
         uD0Rg+k9jw8p4rH42nrGy+l5VMcQJd5hhtc8Z/knYmgQVD0eX/LZaSS46Y59hCcz3c
         OExGFXz70p2vA==
Received: by mail-lf1-f71.google.com with SMTP id o5-20020ac24c45000000b003fd932e4642so3422114lfk.14
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 01:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iGpGmbwC/XUGzipXWdmzUImvvrSqMI37QUV5/5ZOdKM=;
        b=bPOYudIhidHEF5mn9PmYl3/3W4VAL8jUNgqAc25yGX/a0gjmGxP4W+cklPnF4VuTBG
         RE5upLSI6hjWPBn9CV6H7HLUYflvJtXj4fl7XhwDk3ppfshD5T/Kl1ziWYMQhBA4JgrB
         FeRmQlcOyyV22Eh/6Jno3c0y3arx/0wMZxz7SPeEidpZ7ct/j33iCfDTdWxvLGPAu+Wc
         RaSgcqXx8QcbRHb0RGIJ3ZqDfhSElWpaWcQqlo/NQo9g7XOL4Z6hStFr9aAT8ALEX+xD
         WSCqhnz+cnyzHv+ZXm07obZiQ9Y5Yz1fRkZDAoRACgssy1hcaR6gleLgkjsTmKg6LpIO
         YDPA==
X-Gm-Message-State: AOAM532MPH/RjYVz5pcdGqOvV1vBKGad+sji6M3H0ZuCCWtDoc4zNY4F
        szYQAafMChuB3GXuQxWWsNq04ZJGR8DKee7r27HtP8udOkkpD9S+52+Zl0yYsvH/RW5fBuhWb0p
        2Tc6fNOgRbZzx0hhf5G0qW9QTpCT80LlUqJ7zhw==
X-Received: by 2002:a05:6512:e96:: with SMTP id bi22mr32713187lfb.156.1634027383148;
        Tue, 12 Oct 2021 01:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB++EhkkGqUB23nWGZIGhBurRqOemieVTFSKW5Gv1q+IvObEloBVf0AhlKcitoUCD+gPLm1Q==
X-Received: by 2002:a05:6512:e96:: with SMTP id bi22mr32713168lfb.156.1634027382990;
        Tue, 12 Oct 2021 01:29:42 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c16sm1041571lfi.180.2021.10.12.01.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:29:42 -0700 (PDT)
Subject: Re: [PATCH 8/8] rtc: max77686: add MAX77714 support
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-9-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ae0f0f8b-3328-921d-1a3f-fb05859609ab@canonical.com>
Date:   Tue, 12 Oct 2021 10:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-9-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 22:25, Luca Ceresoli wrote:
> The RTC included in the MAX77714 PMIC is very similar to the one in the
> MAX77686. Reuse the rtc-max77686.c driver with the minimum required changes
> for the MAX77714 RTC.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> 
> *** NOTE ***
> 
> This patch didn't reach most recipients having hit a limit in my service
> provider (125 e-mails per hour). I'm resending it, as far as possible with
> proper message-id etc. Apologies for any duplicate.
> 
>  drivers/rtc/Kconfig        |  2 +-
>  drivers/rtc/rtc-max77686.c | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
