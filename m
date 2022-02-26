Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596234C525F
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Feb 2022 01:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239915AbiBZADS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 25 Feb 2022 19:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiBZADR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 25 Feb 2022 19:03:17 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E19156C7A
        for <linux-rtc@vger.kernel.org>; Fri, 25 Feb 2022 16:02:44 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id w4so5578009ilj.5
        for <linux-rtc@vger.kernel.org>; Fri, 25 Feb 2022 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4TpFdWGGu68hiozG5aqHPRXt94qhCk+o6JG516+kdbE=;
        b=DzGxjc6L9fhiwmV2m0lZXtTqNZOD0d6unMPEKi/4vECMwSDnZGJKgitxTQY+EiEGfy
         XquzQiMm6zyfeB2uD/xjaAvx/63eP9LCMpLBaaYVhBv327i4srbO4RFScHr69DptsG+L
         emmu5kQvsQAaBRhnQy43NaHkWsS8brDZvR1RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4TpFdWGGu68hiozG5aqHPRXt94qhCk+o6JG516+kdbE=;
        b=wF47enV34JUBg6HmNqpHw8QjFc9FoFDVuOc5e8q6yF1Mhxf6Yb9q8Vp5DMOj8FJNkI
         cUk4f66m6+AEAyMa6qMGjRH1qapuM56A33bv5n5pq2W2tOuAFmSQCAsMVsEvvAet331x
         o9UEhTaefkKnkDExEKaYcp9P2Pj9qkk7jL0T4TmDb/2WhK95+lB8Sl1sHfz6cXcmcQcj
         Ds8fbF97our3Y6MHGRXWp6kQcbJQYjnvzI8J0qRfe8qUSJBfLPyv3krEBjh8aHtLus4h
         i3g/zjv/bEC8hibfDZL/pI9EpCZGUldj8nSTJSSP62tpNB/5aMsZ/k7UrBctk06XIjo0
         hPKg==
X-Gm-Message-State: AOAM533F9aroRKzaZji4vYMl05SfJcf0jX5F8eXkKNqjDnXhf6Eb93ZD
        w211XUOjiM18gqZkvI274Dqqp5f9NXxnng==
X-Google-Smtp-Source: ABdhPJyeiNDbp52Qr+n41Pw/M9uNVzxmLnxPbY1ljMyWkWITko2VTAG5m4gcWRKj5yoMXnCSK8iSpA==
X-Received: by 2002:a92:cf43:0:b0:2c2:841e:b03b with SMTP id c3-20020a92cf43000000b002c2841eb03bmr8009336ilr.68.1645833763950;
        Fri, 25 Feb 2022 16:02:43 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id h6-20020a056e021b8600b002bf45d43938sm2400916ili.86.2022.02.25.16.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 16:02:43 -0800 (PST)
Subject: Re: [PATCH] selftests/rtc: continuously read RTC in a loop for 30s
To:     =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220219072713.5280-1-mat.jonczyk@o2.pl>
 <6d8f500d-0ee0-3e27-dfdf-e8c0a34880e5@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fb6da998-3970-90f9-f79e-386987bfd431@linuxfoundation.org>
Date:   Fri, 25 Feb 2022 17:02:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6d8f500d-0ee0-3e27-dfdf-e8c0a34880e5@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 2/25/22 1:56 PM, Shuah Khan wrote:
> On 2/19/22 12:27 AM, Mateusz Jończyk wrote:
>> Some problems with reading the RTC time may happen rarely, for example
>> while the RTC is updating. So read the RTC many times to catch these
>> problems. For example, a previous attempt for my
>> commit ea6fa4961aab ("rtc: mc146818-lib: fix RTC presence check")
>> was incorrect and would have triggered this selftest.
>>
>> To avoid the risk of damaging the hardware, wait 11ms before consecutive
>> reads.
>>
>> In rtc_time_to_timestamp I copied values manually instead of casting -
>> just to be on the safe side. The 11ms wait period was chosen so that it is
>> not a divisor of 1000ms.
>>
>> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Shuah Khan <shuah@kernel.org>
>> ---
>>
>> Also, before
>> commit cdedc45c579f ("rtc: cmos: avoid UIP when reading alarm time")
>> reading the RTC alarm time during RTC update produced incorrect results
>> on many Intel platforms. Preparing a similar selftest for this case
>> would be more difficult, though, because the RTC alarm time is cached by
>> the kernel. Direct access would have to be exposed somehow, for example
>> in debugfs. I may prepare a patch for it in the future.
>> ---
> 
> Looks good to me. We end up tweaking the timeout=210 in settings every
> now and then. Not sure how we can avoid adjusting it as we find problems.
> 
> I will apply this in for Linux 5.18-rc1
> 

Applied to linux-kselftest next for Linux 5.18-rc1

thanks,
-- Shuah
