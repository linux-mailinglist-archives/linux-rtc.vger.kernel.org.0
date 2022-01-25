Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E6349BD7E
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jan 2022 21:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbiAYUxC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jan 2022 15:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbiAYUwj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jan 2022 15:52:39 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6EEC061747
        for <linux-rtc@vger.kernel.org>; Tue, 25 Jan 2022 12:52:39 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id e79so25198445iof.13
        for <linux-rtc@vger.kernel.org>; Tue, 25 Jan 2022 12:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/uOHuMBWIqzsPRu5jrm/RXJrpyoE9KrZzrG0nDPUmUQ=;
        b=JA+X+D2+jQGjPHUgwaZzAw+G+IQHrce37PdG/w1rApmU3BRC+yo8W8Xt69hHa3+5Nn
         hnu9oK6xriVCICmj+Nqb5d/iCrD3X3jdE4DyRwouIhxfexMlkg7AniiMN8p6YVmMPFtF
         6fL2JBp5Q8l3cbo5zDPEc0mPpMzonGORnkZfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/uOHuMBWIqzsPRu5jrm/RXJrpyoE9KrZzrG0nDPUmUQ=;
        b=0LCztf5kbyk1M8O4Cem+EAtQxsgWLOTI1AkCDE3HAfDBYlhUcw72UYtGCtC1R8jCaZ
         ByaqCPGgEzyyCeResHrGE409iSi18kJvvM7x5IwUi8rQiS8MD/5GD62FI3VtAoxuleux
         DWEVQ/8Jo48F2QxcDcAtiNqnabxN9UQEBGyl/7vbgbglp6gSbclVn1UZvxin7UpVdX7Y
         yLPMAVYIgthiYznQl5PTve5yMhXP+c51i66bNCUJJnaEtqE/WZsD4H2C6ghiaig7ySTf
         f3YEzlmNLvdww9fB8LUYFhnBZ+nb3rKS1if4VqRo7e82qzZxa8+zW3V/6giAqUmqs0cO
         3Esg==
X-Gm-Message-State: AOAM531Lm3R8jdF7PFRh0Rp1I8OJTV7KW04sRLFqCNfWzElzv2fb7/0W
        iDlwE1P8wyC0GsreU+ncR08vPA==
X-Google-Smtp-Source: ABdhPJxN5vxdRGXKizCDaf0QNPFfb9X1rWosGXVW7lkFLPqOqM7d9XyixC0OdcgYRCUYQrxNgJtUsA==
X-Received: by 2002:a6b:8d42:: with SMTP id p63mr7839784iod.27.1643143958887;
        Tue, 25 Jan 2022 12:52:38 -0800 (PST)
Received: from ?IPv6:2601:282:8200:4c:4ef8:d404:554b:9671? ([2601:282:8200:4c:4ef8:d404:554b:9671])
        by smtp.gmail.com with ESMTPSA id e17sm9299318ilm.67.2022.01.25.12.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 12:52:38 -0800 (PST)
Subject: Re: [PATCH v2] selftests: rtc: Increase test timeout so that all
 tests run
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220112194142.3276385-1-nfraprado@collabora.com>
 <Yd84cDlW9+f7wQxq@piout.net>
 <f286a86d-6371-d8bd-6ca9-5f622468d1a4@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ae754c5f-909c-776d-ac65-7ea95fe22acc@linuxfoundation.org>
Date:   Tue, 25 Jan 2022 13:52:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f286a86d-6371-d8bd-6ca9-5f622468d1a4@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 1/12/22 4:51 PM, Shuah Khan wrote:
> On 1/12/22 1:22 PM, Alexandre Belloni wrote:
>> On 12/01/2022 14:41:42-0500, Nícolas F. R. A. Prado wrote:
>>> The timeout setting for the rtc kselftest is currently 90 seconds. This
>>> setting is used by the kselftest runner to stop running a test if it
>>> takes longer than the assigned value.
>>>
>>> However, two of the test cases inside rtc set alarms. These alarms are
>>> set to the next beginning of the minute, so each of these test cases may
>>> take up to, in the worst case, 60 seconds.
>>>
>>> In order to allow for all test cases in rtc to run, even in the worst
>>> case, when using the kselftest runner, the timeout value should be
>>> increased to at least 120. Set it to 180, so there's some additional
>>> slack.
>>>
>>> Correct operation can be tested by running the following command right
>>> after the start of a minute (low second count), and checking that all
>>> test cases run:
>>>
>>>     ./run_kselftest.sh -c rtc
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Thank you both. Will apply this for 5.17-rc2 once the merge window
> closes.
> 

Applied to linux-kselftest fixes branch for rc2/rc3

thanks,
-- Shuah

