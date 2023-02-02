Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE90687C2E
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Feb 2023 12:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjBBL2P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Feb 2023 06:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbjBBL2N (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Feb 2023 06:28:13 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7428C1632D
        for <linux-rtc@vger.kernel.org>; Thu,  2 Feb 2023 03:28:10 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o36so1141419wms.1
        for <linux-rtc@vger.kernel.org>; Thu, 02 Feb 2023 03:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xz4rQVtqStkLN1QgloBn4UVZQaeKASMZkIIj+VC1lV8=;
        b=OLmZaQzEvAM9UQ58gMuaq/VfYYamVCPuCoyyDLXynbCDb3wpKMiqqQ3jn+0OZyDhO1
         mARdkJKm+gHMHcQVajhKW7OAFLuD43Bwy3ll0XqlI2UZAWIP5Gvc95ExYPXVLAKKXIGT
         215MCsRQv0rw9Uj02S5Qzak6thNs1PEvq3jZ1O5lArHCH2BJwmoKdkzUCcNfBNY8/9l9
         +YcMZWCw04SKy4Y7qHuAKe+s6DnwylCQVfRFZILXCvN10PBGhWcPg52aHMlhq1RmPGeb
         oNzTJ0jV5R19bjSwEfkAUi7X6DqOLFJ1OtZ0uHfFJK++3Elv5+lHmaB3tsOzdYtnYwqj
         caiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz4rQVtqStkLN1QgloBn4UVZQaeKASMZkIIj+VC1lV8=;
        b=d1GyNHKJ0H8YwRtNfkWNw8Q7MFydnrLTGXSp+4eYrYRz1oOeo1LqOjMaL9bIoiRLmN
         yQ+4mRwsNpHQRvrpZ26Su+aPrV+yaGNKtab5G1dtUsP8+VBobznuGGQ5V/mhjfx6T9Lz
         Y2OrnWjPZCr3TY1NbXQwloIgdm07tj3xLADN6+UJDexRPBTmYUoTsHd5wO3BcuxP/zwL
         L9xRlPpVI/gGjJJ/wQL6ZzqfDGF5lRf+qTf7fQgDUkFaviwWTwtpM7AQzr/gG8CYHVMu
         iB6CLNsvGD6fDBNMQzhUMVjWXaU0mbqzwj4M6GzP323GtyItIaGMDXJXFSMTuVd6KUD4
         Y8cA==
X-Gm-Message-State: AO0yUKWFdvsxFa+pBrWvTxbzETdFPER54Wgu48FqcIst4ZNAq9wUPq07
        V2ZAvD8zeTpwutmTH+CFuhMbJA==
X-Google-Smtp-Source: AK7set8x8+W/GUIVZbhPBKDNCv6UGTY9N0ydmkGFu/39U23wYEqA8P63uLXoRsP28W8BfDq+f9AnJQ==
X-Received: by 2002:a05:600c:5406:b0:3dc:5614:919f with SMTP id he6-20020a05600c540600b003dc5614919fmr5575428wmb.23.1675337289054;
        Thu, 02 Feb 2023 03:28:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600c2e5100b003dd1aa227afsm4146628wmf.31.2023.02.02.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:28:08 -0800 (PST)
Message-ID: <e70b3ba0-145c-9e5e-9af8-c02b074b0ad4@linaro.org>
Date:   Thu, 2 Feb 2023 12:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] rtc: s5m: Drop S5M8763 support
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20230131183008.4451-1-virag.david003@gmail.com>
 <20230131183008.4451-3-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131183008.4451-3-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 31/01/2023 19:30, David Virag wrote:
> The S5M8763 MFD has no device tree compatible, and since board file
> support for it was removed, there's no way to use this MFD. After
> removing the remaining code for it from the MFD driver, also remove
> support for it in the s5m RTC driver, and all remaining references to
> it.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

