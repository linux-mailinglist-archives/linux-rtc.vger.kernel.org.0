Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BF0378F19
	for <lists+linux-rtc@lfdr.de>; Mon, 10 May 2021 15:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbhEJNde (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 May 2021 09:33:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43327 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345187AbhEJMWB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 May 2021 08:22:01 -0400
Received: from mail-qv1-f72.google.com ([209.85.219.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lg4u7-0003Ja-LB
        for linux-rtc@vger.kernel.org; Mon, 10 May 2021 12:20:55 +0000
Received: by mail-qv1-f72.google.com with SMTP id l5-20020a0ce0850000b02901c37c281207so12356040qvk.11
        for <linux-rtc@vger.kernel.org>; Mon, 10 May 2021 05:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+brPHK6z0qfj8MD7JTAIcwTm+x3W3WlQXIOTpGxTZ8=;
        b=hy7n9KddpDPnmDwidcBblEZyc/8G0laiVp3ogRs64aL911gH8+0Fkx/HIWdcAVdAyT
         8yjxxAiO4WOFsDicpc0vTvdhf96EPMTOnWT067uhJNRILEgjE9Bc/vy/kqKdSkgm7QN7
         Qv2M5hETWQTsvswEgg0zJwgp6vccUQ+CXbqmkT1mRLZh6XZZqbS+nI4RBZtaUY4K3/D3
         WU8+qGZNJMHUPn2v9itiM2/Vp7lBCctNN83EGGBZ8tKXl/T0WXQSI07DnATQa4bcEHPX
         b0DHHmaOywtbavRyelCEbmgfLwM9reGocoezH2g2IzUd1gWmqfk9yhU5oGrphwj17YS3
         zMBQ==
X-Gm-Message-State: AOAM530NHV9Hkfs2KFIPpDtCiqsxZVfhd0pXeItJMtXOwKg0ly1rOgPm
        kZTNON3D8zJlKfPWkbpZtOLFryM1kSsdyN/XBQoBlwnIGY8aH1D+4NvkTWtR/5tXEqCGpIlQMU9
        k/98puqlKEZG3h9GnWY0f6MAkiC7TEGvVUvvdJg==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr22423554qte.301.1620649254827;
        Mon, 10 May 2021 05:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMunM+w/xF+r8imk3jOy21ySiyKh1GdRxXlfCXnAc7JoAsdSDDjE6CNw9JyHSGV2p/qnWbyw==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr22423538qte.301.1620649254655;
        Mon, 10 May 2021 05:20:54 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id v65sm11805007qkc.125.2021.05.10.05.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 05:20:54 -0700 (PDT)
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
 <YJhO0cEqpbJAdv7s@piout.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <219efcc7-ca05-a7d1-5943-d34a42f0d49f@canonical.com>
Date:   Mon, 10 May 2021 08:20:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJhO0cEqpbJAdv7s@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/05/2021 17:06, Alexandre Belloni wrote:
> On 08/05/2021 18:06:03-0600, Edmundo Carmona Antoranz wrote:
>> On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
>> <christophe.jaillet@wanadoo.fr> wrote:
>>>
>>>>
>>>> Following the recent conversations, I think it might make sense to do
>>>> dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
>>>>
>>>> Is that right?
>>>>
>>>
>>> Yes, it is right, but it should be done in another patch.
>>>
>>> Would you like to give it a try?
>>>
>> Sure, I'll have the patch ready to send it when I see yours on next.
> 
> Does it make sense to print anything at all? Who would use the output?
> Is anyone actually going to read it?

If the RTC core does not print the message, it should be
dev_err_probe().  However the first is recently preferred - RTC core
should do it for all drivers.  I find such error messages useful - helps
easily spotting regressions via dmesg -l err.


Best regards,
Krzysztof
