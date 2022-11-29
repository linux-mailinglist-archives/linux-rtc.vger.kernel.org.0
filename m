Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0219463C1EF
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Nov 2022 15:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbiK2OKg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Nov 2022 09:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbiK2OKP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Nov 2022 09:10:15 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C1B5C0FE
        for <linux-rtc@vger.kernel.org>; Tue, 29 Nov 2022 06:10:04 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id h10so561985ljk.11
        for <linux-rtc@vger.kernel.org>; Tue, 29 Nov 2022 06:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqVtLXiq1FYLM+aSPqIKQjsXuT+N9Rkyh7hQ+06pZLY=;
        b=ImBAr+UZq1NssjtUCaT5+KglRkfc2ennR/CTDF0EEDD+7vb4XjJ3daiFuxAIh1bWJk
         S0lzrM6ZxlOtfJcAhIJUscNV2WYpjtGZ59FtnKZ+QHyHPyNm88qSzfLobJMgxKL5awo1
         mpCOG9wJkV8/8wH+g3PttseDFPi9Qs1r9/wT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqVtLXiq1FYLM+aSPqIKQjsXuT+N9Rkyh7hQ+06pZLY=;
        b=qZ/cXIQ/WMq/0ssHjsf73bJjuIsyj2XretiD0CKdxAoeGOpRSg4tgdswKGHfw/K0YF
         zYaOVemRVptE//USqyJFAncGXN7Sg077J1U67iwtJlBlCLrcEACE9H0v0jQj1uifuWs2
         Puym5S1J5x+alENf47vEgXV2DadZJHegj2tAyHxScItmqw8pv+bfOrbq2K9YtyTMhLoL
         2XlV0HHzAI7YPgZZBe998rksAb5QVl4w1P6jd3sWhsoXILWr6dGyvlMSAtOC47wwcnkN
         3Jgg6LNneF6cnwcnkCrxAOG8dv4XWuYje6pFPQElPLdIVwmdrOwatfqvnGeuFK9lcTrU
         SDBQ==
X-Gm-Message-State: ANoB5pm2yAZptivEVoL64bgj6MHl/ogLGHXjcfdkcpw+CJdFVQK76PIM
        ui+OP/wI1D8j6sLE6xIpJRe1WQ==
X-Google-Smtp-Source: AA0mqf4ZQckfrXPfumRjMm60OiOaK0PiYODF7ceASbWqXiI3Cb6b2jZNnnbTKUbmWkk4G+ULoTOS/Q==
X-Received: by 2002:a19:f610:0:b0:4b4:a536:f866 with SMTP id x16-20020a19f610000000b004b4a536f866mr17711021lfe.262.1669731002387;
        Tue, 29 Nov 2022 06:10:02 -0800 (PST)
Received: from [172.21.3.193] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id y1-20020a056512044100b004b4bb6286d8sm2233675lfk.84.2022.11.29.06.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:10:01 -0800 (PST)
Message-ID: <a004a051-2f63-b5a4-bf7b-925850f1f718@rasmusvillemoes.dk>
Date:   Tue, 29 Nov 2022 15:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/5] rtc: isl12022: Get rid of unneeded private struct
 isl12022
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, da
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/11/2022 15.18, Andy Shevchenko wrote:
> First of all, the struct rtc_device pointer is kept in the managed
> resources, no need to keep it outside (no users in the driver).
> 
> Second, replace private struct isl12022 with a regmap.

Nice simplification.

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

