Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1102458562
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Nov 2021 18:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238395AbhKURXr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 21 Nov 2021 12:23:47 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49664
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233693AbhKURXq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 21 Nov 2021 12:23:46 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB8503F32D
        for <linux-rtc@vger.kernel.org>; Sun, 21 Nov 2021 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637515240;
        bh=NhrY2YoYU8o49TvBH2U7Xc9BTYaL2Sw0oQZK6cM53jg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=A790Fe7d5Pgr4WRmbxlyDsOGjRddmKqGwOMTmQxiWXNZew6AO3HSTQi0xA7QXb0Dx
         hmNXHB9/QmjKlRYGTwOVm2o7fWVcnlC/bKIHrSeiOgXUhHyIBAdV/Flc0ebjx8DhAf
         IgSWMLr6UtXeoV2V1ZvpCGv0Gabme1r+kvMK/wBgI53dO+SwOli91pib9xB4KSAg6K
         kVvUPmC+qOtRmup8H/GpkWsbdMaoivXvmF9cAVjY9i9yW4c0rjoP0yPZPhLqAkHL+W
         30ADOV0kFUtwM52dgrERdvW4q2gEwGZhlWro/smYJVzMtOogIG/rohMYiCSo0/tZ9t
         doEwsPohFB8AA==
Received: by mail-lf1-f69.google.com with SMTP id b23-20020a0565120b9700b00403a044bfcdso10300575lfv.13
        for <linux-rtc@vger.kernel.org>; Sun, 21 Nov 2021 09:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NhrY2YoYU8o49TvBH2U7Xc9BTYaL2Sw0oQZK6cM53jg=;
        b=gQOs54DMXNQ2FU1jqshtfkzTaetAF3pnNxDiyTNQdaWgyReLFJ9KcDasJtBy1NdomC
         QYGQYXxFhMCwgsQ93hme1TRImTzBQ1DMwd0neyOjWd1DI32b2CeCxtiguyGqBed5Io8S
         NqarP4JPucZtVog0GuyyiWCPNGqdex6VwZhs6Hv1tazL5M/0tlHqmTY+WBu+/Y3LyT0l
         SwZTKqObansE4kIJDlYf52jsu7bsHy8aEQpFt/NH9nIiYm7Zgn2pUq4QGdtEpNdi1Nl/
         lDir+VByLI7NFdsDkGyBvmjYk/Phls5r7w4lK2V4SRbBO77TRFtdjTFQc+olBWylY7zA
         aF/Q==
X-Gm-Message-State: AOAM5300NCu7A/Qu9+PwGHJ0BN0eQfYVkamhM4JjPDGQtvG867ASiwdZ
        y/fKWBLFNOnQMDMukPH83V8YeAYF3klRvqfjxAOjFUqijo8Dth1HND917JyGHVJwlSejHoZPVrU
        sZpOKjc+H1/cuZRzl8oZ9lXN+bP4/xQ/gz9A0Lg==
X-Received: by 2002:a05:6512:3996:: with SMTP id j22mr52673217lfu.637.1637515239404;
        Sun, 21 Nov 2021 09:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3OJlK6L++IcfAoz7b9WAy/3faXnNWTTp/ncrpwEtPTPXJ5uUwkzUh2rlxkju/Nt2T4ynj0w==
X-Received: by 2002:a05:6512:3996:: with SMTP id j22mr52673176lfu.637.1637515239152;
        Sun, 21 Nov 2021 09:20:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m8sm799964lfg.140.2021.11.21.09.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 09:20:36 -0800 (PST)
Message-ID: <42516013-3b4e-0c05-5e4a-5a1fe9ff942b@canonical.com>
Date:   Sun, 21 Nov 2021 18:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 5/9] mfd: max77714: Add driver for Maxim MAX77714 PMIC
Content-Language: en-US
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211120155707.4019487-1-luca@lucaceresoli.net>
 <20211120155707.4019487-6-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211120155707.4019487-6-luca@lucaceresoli.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/11/2021 16:57, Luca Ceresoli wrote:
> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
> watchdog only.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes in v4: none
> 
> Changes in v3:
>  - Suggested by Lee Jones:
>    - move struct mfd_cell to top of file
>    - remove struct max77714 and its kmalloc, not used after probe
>    - reword error messages
>    - add "/* pF */" onto the end of the load_cap line
> 
> Changes in v2:
>  - fix "watchdog" word in heading comment (Guenter Roeck)
>  - move struct max77714 to .c file (Krzysztof Kozlowski)
>  - change include guard format (Krzysztof Kozlowski)
>  - allow building as a module (Krzysztof Kozlowski)
>  - remove of_match_ptr usage (Krzysztof Kozlowski / lkp)
>    (Reported-by: kernel test robot <lkp@intel.com>)
> ---
>  MAINTAINERS                  |   2 +
>  drivers/mfd/Kconfig          |  14 ++++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77714.c       | 152 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77714.h |  60 ++++++++++++++
>  5 files changed, 229 insertions(+)
>  create mode 100644 drivers/mfd/max77714.c
>  create mode 100644 include/linux/mfd/max77714.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
