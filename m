Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DABA78551D
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Aug 2023 12:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjHWKOi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Aug 2023 06:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbjHWKOe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Aug 2023 06:14:34 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DE3133
        for <linux-rtc@vger.kernel.org>; Wed, 23 Aug 2023 03:14:26 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so6918705a12.1
        for <linux-rtc@vger.kernel.org>; Wed, 23 Aug 2023 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692785665; x=1693390465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mo5/7rcHcq3EQgUwAoIukeLa+fenPjchd8RqeRcwzh0=;
        b=ihbNcP54FHcDcsNQrJFy0GzOhp3tX+EONzYnWeK6M6avTg1a2bKWR/FIon1jVynIFF
         b/8wrIu7GYhe9zB5u9KsIRwrSfLxXB6H3jZ+j0GlDrRhkYg60dC3Tqsf86HgGHn3o575
         lvOfUWlDqJssE01ir92sNmJlzB+sqgpw87Pe+8FlfeYJ3aRiQwXgTNU2R6NRZuOFTxQu
         OkUdcDurENzHPaqYct0JDv5GDG6HHGTaHMfPdOc+HLtRMTDg2/Gu0eUxydxWgl1wp27b
         6CQa8+Cw+wiKh5UCeyEMS6Xr5a1WwfCayQGIr1AxUzrJB18El8LCff29uONOyMSC39n2
         j9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692785665; x=1693390465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo5/7rcHcq3EQgUwAoIukeLa+fenPjchd8RqeRcwzh0=;
        b=Oed8VQr3nqgMOMgIOaLudd5+hQq+lSuKxKzr+tg9/MLGwtxAdqtoED+X1nRfNw3Xop
         7Oyy89lU/3+qx3yzqwZwOl2gJOfeFzGvGRriKYPDNHQYyVLXbDkQnNtnAbD5bXzrhpEN
         f89tvqLO1n0vockqNdzaYSvmaOTtGbobM1IPzYV+3NykUv8fEPqeo/p69v+RbPAf62dA
         d6r2TIx7KX3RHJfQKsQNaj7D7f68t/Ihx540c14A/G9kF8C+kphkDeAc16jzur4++zXF
         cN5QdoIbdlyfjbODXhXKIZf5IWb97+jOF8MCA4pZwCr3C0A588WK0vwiHA/NQJ3uB7ig
         eekQ==
X-Gm-Message-State: AOJu0YyMJa/BfM3g/U29KLVHKBPraXBAh9Hvb4Y02K7zlqDv9iOdjXnI
        MpOkTueR2mrHftjPbCbrFcrKQA==
X-Google-Smtp-Source: AGHT+IFF2WpbdYLFr/XFlhvXm6Isl4hPxZl/sv6oNX9VHvKVNXhsnhVKAZJbBOlUpIWjtMKFpzn9lA==
X-Received: by 2002:a17:906:74c8:b0:9a1:d29c:6aa9 with SMTP id z8-20020a17090674c800b009a1d29c6aa9mr1332297ejl.11.1692785665370;
        Wed, 23 Aug 2023 03:14:25 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id sa4-20020a170906eda400b00992665694f7sm9585022ejb.107.2023.08.23.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 03:14:24 -0700 (PDT)
Message-ID: <19f09a5e-c420-f209-ebef-cfa36ffa8467@linaro.org>
Date:   Wed, 23 Aug 2023 12:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] rtc: m48t86: add DT support for m48t86
Content-Language: en-US
To:     nikita.shubin@maquefel.me, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20230823-m48t86_device_tree-v1-0-240023b435ac@maquefel.me>
 <20230823-m48t86_device_tree-v1-2-240023b435ac@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823-m48t86_device_tree-v1-2-240023b435ac@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/08/2023 11:03, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add OF ID match table.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

How did these appear? It's v1, so it is a bit confusing.

> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

> 

Best regards,
Krzysztof

