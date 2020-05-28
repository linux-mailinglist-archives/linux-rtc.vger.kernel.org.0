Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA381E5715
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 07:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgE1F4X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 May 2020 01:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgE1F4W (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 May 2020 01:56:22 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E25C05BD1E
        for <linux-rtc@vger.kernel.org>; Wed, 27 May 2020 22:56:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z22so15903073lfd.0
        for <linux-rtc@vger.kernel.org>; Wed, 27 May 2020 22:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MlcsbNqPkCiodh1hJZSEMfM1R7qAoz4m5QUloEzsR7w=;
        b=HRNK77NB2axB9KkU9TT+2duYGgueeUI3wGR82/xAkdyteNNNy0SyfV1TwDx9O2TOg5
         T9jH2ze/0MR3tKV0VM1UkORdw+VT3dW4E/LSfNIY6VJPlBahSbwlW+zLQt6nQn0Pwckn
         WedXJkpp3vfPYEvfaFBYjyV9SLg3b8dtahR5M9iPCtVRbr2ZQPmmz3yC7fLGtPyj3Tyy
         TeIJkz5h3IPc+nvtCv+wfeAC/Z0XqrD8q+WwUWE1Vj/Vk7et+37u1KtxXY9guFvGv3+u
         xnElB4QC2AMmsV686pogmYkXMena216VIk3BzzYJue3tJWohbSid9xvaWyxPqthJNY/O
         WGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MlcsbNqPkCiodh1hJZSEMfM1R7qAoz4m5QUloEzsR7w=;
        b=ofAJ98bVzPqO9hjhpkUsEdOeLGU8S3Ep8GufwvNixVnkR0NOXaF2SmArEbI+W4ACIE
         ptW8JJC78wxIULJYtR0xIcuK/k9fk0p0tU07UQ0XEPhFgVzagKRCfjd5FXj6cX2VvNi4
         +xKJg4YtyD4mwqgdcZq3GiLgZkGzr+Et/bto/J476jEBbY2ORNDbrpEOUg8IAdu5GsZY
         O+GXWM/YRRMb2PliqGfeqMu8PLqziYwu8e2XS3IHnedPOng0c8lY1yDlpZVFRVwigHfP
         4udyeJFAbFuxTasZEI5un4EfcQPUdrB33rn5LDWM7hqrvGjx2y02PsoylU0euKZroT8K
         8SSA==
X-Gm-Message-State: AOAM5333Q/Cf65lxLSwxD7RZj/rc8YBa+cp4RqdMjXXcg5pr5/q1yO8I
        /pqLtdOB8HXz/zOk18cxlvzxstlL
X-Google-Smtp-Source: ABdhPJz+aCSj40ttEp+4xrsF485gTOv5LHn0TvD0sf3jVv30sxDslsYE+5WpJMssCPutyRDeuM432g==
X-Received: by 2002:a05:6512:3329:: with SMTP id l9mr764924lfe.138.1590645380091;
        Wed, 27 May 2020 22:56:20 -0700 (PDT)
Received: from [192.168.1.10] ([95.174.107.249])
        by smtp.gmail.com with ESMTPSA id e18sm1201944lja.55.2020.05.27.22.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 22:56:19 -0700 (PDT)
Subject: Re: Automatical handling of /sys/class/rtc/rtcN/offset
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
References: <810d81d9-847d-a849-bf8e-49ea59ba6b83@gmail.com>
 <20200527230646.GN3972@piout.net>
From:   Igor Plyatov <plyatov@gmail.com>
Message-ID: <cad4d1c4-65a3-90c6-a43e-8d45c842c0a7@gmail.com>
Date:   Thu, 28 May 2020 08:56:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527230646.GN3972@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear Alexandre,

> Hi,
>
> On 26/05/2020 21:57:50+0300, Igor Plyatov wrote:
>> I have found that my RTC  (M41T00) is capable to make precise compensation
>> of offset in the Control register.
>>
>> Its driver, rtc-ds1307.c has support for such offset compensation and
>> provide the /sys/class/rtc/rtc0/offset file.
>>
>> Compensation tested and operate as expected, when I manually read/write
>> offset value (in PPB) from/into the /sys/class/rtc/rtc0/offset file.
>>
>> Does handling of such RTC offset already automatized somehow instead of
>> doing this manually?
>>
> No, my plan was to add support for that in chrony. chrony is already
> able to calculate the correct offset but it doesn't make use of it for
> the moment.
>
> What are you using to calculate the offset?

Currently I do not have production ready solution for RTC offset 
compensation.

For test purpose I do following:

* synchronize OS time to NTP - ntpd -q -n;

* copy OS time to RTC - hwclock --systohc;

* wait some period of time (24 hours or more) to reach noticeable RTC 
offset;

* copy RTC time to OS - hwclock --hctosys;

* synchronize OS time to NTP - ntpd -q -n.

Last step show me RTC offset, which used below in calculation of RTC 
drift, in ppb.

RTC_drift = 1000000000 * RTC_offset / Time_period.

For example, RTC_drift = 1000000000 * (-5.0676 s) / (24*60*60) = -58653 ppb.

Apply negative RTC_drift to Control register of RTC by command

echo "58653" > /sys/class/rtc/rtc0/offset.

Best wishes.

--

Igor Plyatov

