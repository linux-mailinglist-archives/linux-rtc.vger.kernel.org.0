Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411F36B021A
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 09:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjCHIye (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 03:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCHIyd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 03:54:33 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649CF85B32
        for <linux-rtc@vger.kernel.org>; Wed,  8 Mar 2023 00:54:31 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id a25so62926991edb.0
        for <linux-rtc@vger.kernel.org>; Wed, 08 Mar 2023 00:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678265670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wXJYncbOiARunmZOKSz6kRND0RbNFzoKAf3EYsg3Pk=;
        b=Z4Nk0Hl9fOyYKD8VvPZ6gI+4Uec7H1Mu0xkrBIbRjSW3DCnSWLVQJPnmlsbFEbIzms
         WNbruvxKVVyLNS3qhHHMzHmyrh1LqPNyEdkY1rCG/HO7wRe/HZIZKwSQO2wsbHE1S4S6
         lhxbBl8xbZ6KkcTOe8MxIQIw3nyhV1cfXUJVfylAw5fcgKHGpFqDboBL4WA+hzpsTfC/
         RUhzpFmGHgTpI5UOJOLBQszvhp3bAUIdG8D4FW7f6uqBy9HiMaNyh37XaPRQh1INjskt
         +1B/8I4nR2sX6zaL1JEtu7HrqyLL9lYPXTulGXrnYRdnp0PGpidRejUn/C+9DcR0KD1Y
         AFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wXJYncbOiARunmZOKSz6kRND0RbNFzoKAf3EYsg3Pk=;
        b=PCpV9Fvlbtp6M7mTA3JmOILL01EoGv1swDJUwdiVX8BLoDuxw3ltE/dzy6WZoqRZ79
         SKyQM0XpLiw7RYqTwOkzv9IpSY7U9B694o6tb9lSUIx7udECi2huNJc3CbY9b5aGhbDm
         kGuQ0N7xOI5HYBkZeR6nJU9rYws3NFaLgpEVF098zaJfew7j1gzThamL8F0Nh+Gjgh4+
         0KDvvrerbxhZN+Tnh9mvvof7q2fO7L37ldFXtl+WIfb0XQKw67hr93mlRR14jANvAlyF
         Y5w+HGHY5P4UK5EuFOakvZrM+v74AjJYiD93lZgXnot1u5TVq+7iogePH3+Zt7xhqn+0
         kzzw==
X-Gm-Message-State: AO0yUKWxf0l5BvAYjgegFUIGMuCs/isvm2FqNJWG9Ap0UOLteTBa8xBl
        ICMPp0Ch5HzABLJ+3Ia/bgQHeGlbucrf2nFa0I8=
X-Google-Smtp-Source: AK7set8aYmJmqPbijFinM6/sYgccOjJZfPSh7uxinVuf9CDteUBGnnPPXNZkg2LVcl5gClw6ClB5YQ==
X-Received: by 2002:a17:906:1515:b0:8b1:279c:82c7 with SMTP id b21-20020a170906151500b008b1279c82c7mr16860619ejd.50.1678265669876;
        Wed, 08 Mar 2023 00:54:29 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id ca5-20020a170906a3c500b008bc2c2134c5sm7198574ejb.216.2023.03.08.00.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:54:29 -0800 (PST)
Message-ID: <f1df5968-4322-3f67-3da8-c10ea50386a8@linaro.org>
Date:   Wed, 8 Mar 2023 09:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] max77663-rtc: pass rtc address from device tree node
 if exists
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20230308083759.11692-1-clamor95@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308083759.11692-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/03/2023 09:37, Svyatoslav Ryhel wrote:
> MAX77663 PMIC can have RTC on both 0x63 i2c address (like grouper)
> which is main address but on some devices RTC is located on 0x48
> i2c address (like p880 and p895 from LG). Lets add property to be
> able to use alternative address if needed without breaking existing
> bindings.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Anyway this is not max77663 driver.

The property does not make sense in the context of max77686. Maybe for
max77802/77620 and 77714 would have... but still max77663 is not there.
Don't add properties for unrelated and unsupported devices.

Best regards,
Krzysztof

