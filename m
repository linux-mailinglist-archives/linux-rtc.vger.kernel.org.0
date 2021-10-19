Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42411433BCD
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 18:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhJSQOP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 12:14:15 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59048
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232109AbhJSQOO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 12:14:14 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B96753FFE2
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634659920;
        bh=z7xBLmLcK2X0X5LnkmnTHSBeuEfqcw1Dw/LDIsv+Z6c=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Yy6sMLf10QPp+p7dsrHg2PmdQNn4gHZ5koJbLi8at3OGlYjSHhTWJJegaHXzEEOMi
         O10Us3rbJ8tIQpBNy/NcuYWG8JtgN7ahIpWgAYJKDftl2EEvmTlEz1KfiZk1VFT3if
         shPd6NWEL5jjWYheT+dZuSoOy3Kirq4ymnHiQOVNZYVktuiJyuZLVCD/UVovhsqSez
         WZbXeHgO7omPtD7x66LMDByzRFJ8cCyUyqJzSXyWlI5prhG8B/B9B7MyMZXBZYr5Ay
         6VuHUej+rn+l/S5lcxW0ndlFlcEdVWpDvAgBRuq/Be6Z3d4WKONq/DgOJeL/e4habU
         FF8THgsTSLClA==
Received: by mail-lf1-f69.google.com with SMTP id i19-20020a0565123e1300b003fdc4e26333so1621452lfv.12
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 09:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z7xBLmLcK2X0X5LnkmnTHSBeuEfqcw1Dw/LDIsv+Z6c=;
        b=3aGNpMCrirOXVtCVRStmGBf10UtqIgYekpmgSLAzSbXvIzOWlHzHUtvqc4MqMZvE7A
         +VmAZId1e9inoJJkt1QF6KqH/qs2hJt4khVnNZJ8CxI5i60rSp92xV4wrPMYhACQloQ7
         8XQ+PM23bGTdPFqNN9fvAdwLDgkEbO1UXvAFltOkSk1MVGFxqna8NkN2NXtrjr5Brn30
         OcwY3gEAeTO3K8W1gqphZobHEcZx/2nkz6sH1wW66eZMlc1mgVlA3/Yb6BoWbvghFp5o
         0LXZCDN2stbTritwmKXeE/LkNzNtCnA9dGCIU5eXRfzL3xzfWQ77njGdoXbn2wNcLuN9
         zbLw==
X-Gm-Message-State: AOAM53179Ab/iKrARKNDZT8huJfHDiMAxn9FAXmyFE5UhFzxteYpaQto
        PfBA53QAWQV1VMKvvLZFzMXpGUFaqDyNUi0gx0161PdLLQ3Fd8VeXDxKrX3HAB39Iz3LP9qROgB
        dWhEeKYSsTw0tqkr6xAiqq+WJYuJ5sGMPKdfYMg==
X-Received: by 2002:a2e:87da:: with SMTP id v26mr7525623ljj.187.1634659920234;
        Tue, 19 Oct 2021 09:12:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTg27Zf2509Smzn5DCvG7kNJj6uFchnd2mdxqTdR+kibwBRiaY/9ioxCcyspjAelLWXXAEUQ==
X-Received: by 2002:a2e:87da:: with SMTP id v26mr7525598ljj.187.1634659920014;
        Tue, 19 Oct 2021 09:12:00 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c16sm1837878lfi.180.2021.10.19.09.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:11:59 -0700 (PDT)
Subject: Re: [PATCH 1/4] rtc: s3c: Remove usage of devm_rtc_device_register()
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <85851ab2-af49-120c-ab21-b4152a2ba40d@canonical.com>
Date:   Tue, 19 Oct 2021 18:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019131724.3109-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 15:17, Sam Protsenko wrote:
> devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
> and devm_rtc_register_device() API instead. This change doesn't change
> the behavior, but allows for further improvements.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
