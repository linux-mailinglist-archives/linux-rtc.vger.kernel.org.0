Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDE5457486
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 17:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhKSQ7b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 11:59:31 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:34308 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhKSQ7b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Nov 2021 11:59:31 -0500
Received: by mail-ot1-f51.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso17730173otj.1;
        Fri, 19 Nov 2021 08:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ic35Gd9Ev0F+kGtTAqhnX2kQH5C3QsmaOmP1oDBUdUw=;
        b=FudMcYHYgqaW5gf25/nWIrB2nU0ysZPom7yrxnpQk2GODtEIq+1798WwXZWj2r/p8N
         OTOb875foI/lOxTs0OPKUj2AfhUOVuYpoL7rF6nDiaEq1brNvc8jf6fwG3RzpM+TPR/y
         qNPSUnNuReUYIQdHqvMldFuqHYkaYsQCWv236zCz47+gf9etBZtVkCY7MQ8As6Z4EQ77
         S1uqxk33fvtps9Schz/DuLN3iZxYqJSoX1brn1h7UlpPpw935UbhPUtWGF3kdJe1YWGM
         faV8PFpAwiPI/wOW3JxNd6hADHRbHxH/75i0MDCN3gGGtFE5tghqeTaGofu2I3bG4/py
         /DAQ==
X-Gm-Message-State: AOAM5326td3eDAnjPVD0GZdqHvmoYzFYy5Upbcqbs0wG0BeJmzfIJsNw
        eu20bBpe2u8PoF6Et8FRjvD/55r5NQ==
X-Google-Smtp-Source: ABdhPJxXZt3wNBGtud4TWZ9Br1XwRbMOIEL4GlGdyRYqj4g562v6BGCF71MxxoiuK1t/lLArtd91Pg==
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr5601452otp.263.1637340988960;
        Fri, 19 Nov 2021 08:56:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n59sm74990ota.43.2021.11.19.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:56:27 -0800 (PST)
Received: (nullmailer pid 4060776 invoked by uid 1000);
        Fri, 19 Nov 2021 16:56:25 -0000
Date:   Fri, 19 Nov 2021 10:56:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chiwoong Byun <woong.byun@samsung.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: mfd: add Maxim MAX77714 PMIC
Message-ID: <YZfXORK9ohvI99Xi@robh.at.kernel.org>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-5-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111225852.3128201-5-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 11 Nov 2021 23:58:48 +0100, Luca Ceresoli wrote:
> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes in v3:
>  - add 'regulators' node (Krzysztof Kozlowski, Rob Herring)
> 
> Changes in v2: none
> ---
>  .../bindings/mfd/maxim,max77714.yaml          | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
