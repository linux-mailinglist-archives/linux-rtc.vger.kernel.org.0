Return-Path: <linux-rtc+bounces-2236-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AC9A42A4
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 17:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD53A1C2099C
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 15:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58A52022D1;
	Fri, 18 Oct 2024 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4aA9FCQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B12201101
	for <linux-rtc@vger.kernel.org>; Fri, 18 Oct 2024 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265966; cv=none; b=sbmhrZf0yED+e8D5/J8jRTcL+zZY6WecejaWRV6sIHJBP9vODoCIRuwHgYOA6ZoZO/53/N1PtOLe/p9t6CRfWI5VO0vSRUj4W9R2yU5yyaPm6QuAVZg/jTEqwQ8ZH3PU7QiWIdQTrzNxYM7XNoHnroUTVpe6aGR0H9F8jptgmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265966; c=relaxed/simple;
	bh=ZP+tae5klmCMnR+kw2A6FmL8QwoSk5XUQYePyQfmYAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uqhwb4jNNevZn14cJzq51jaUemQ4hRxjZ+JPZXSWgl9vtqZAJUfS5LcDAKNoaHqVRrNXm5vLrbCjZSPY0OrR8FBob/N3FUDk0MyV4pqofCbAnAwAa+0FWwf/49l91HvI/DcohSz4fLfhDqcPIr70ZVlSCRjeQVRug8xG+WIjOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4aA9FCQ; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83abc039b25so28037439f.0
        for <linux-rtc@vger.kernel.org>; Fri, 18 Oct 2024 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729265963; x=1729870763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOhIwlho/HfHFju/oIk0L9FVfoRtipr8K1k5tMEW8S4=;
        b=Q4aA9FCQ9gVVps/qSraCwa/cGG5lzw4/uypV0D8mEvczfCL+pMktesVIsncw4D51zw
         Jb/tFLCpFUXK4fMMdgRijDv3EVsjkWOnnTf2nY5wJl3jgMS4Um1d3CmZdL8alIAGQ3yf
         e/Or3M1XXa3VpM6Y0cEEQkTlD8Fx/uQAgi2fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265963; x=1729870763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOhIwlho/HfHFju/oIk0L9FVfoRtipr8K1k5tMEW8S4=;
        b=MH2/4CKKxo+EBIvOCLTy9sfkDRJj1/jGRLnS5PEKIk0AM3t9ozPShUOcswedwkbJFc
         salABh/6StEvUkPhp/X9YC/hpcuCi+ml6aFDaHCnoUxiyEZ5LHyk6irmBCn7MruY7YKC
         Kbv9Wg9z7CHOvAYDRMRlznmBx3XEH9OTfWj0Sz+hsJkRxspgCl/AdgxEytGAI8yRSBd4
         xH11L0Kaoy6JXHmkPMiexibMd7Wtu440tWKu94DK8MZI5pE4onQIBSig+X/7WAvPSMzP
         zpNjY9vK0257bNyHHC+A6n56C00BDFyXABZKiQapwoBEE3tMQXiFiGNDqyr+ui0Ag0Ur
         IGxg==
X-Forwarded-Encrypted: i=1; AJvYcCX1hID8b3H8UFeITG6X3vGAqBmVJoQadVWU8uUbRZX5D6CdD/0y+bT6dZcOhFyhEJqbxHltN+NBmKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqxIR0aiZQr7IO5ph4Tw6PhyepuFn4y8jmjhxfvIOgbXfC7tXk
	y5OgX6lGGnWNwr66TAd+wuNQmX3LeuhBsJWafRPTfOEfIl8dK1f6eBuD168c0Wo=
X-Google-Smtp-Source: AGHT+IFfqiAS9ggQMjIGLNW9Cg5NONB155KyHg7OIvgneNWuQmCp1LEfM+7wAzs872RjX2Oeef+Vxg==
X-Received: by 2002:a05:6602:1551:b0:834:f2d5:c758 with SMTP id ca18e2360f4ac-83aba65ec4fmr245111339f.13.1729265963494;
        Fri, 18 Oct 2024 08:39:23 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ab9d80b94sm47685839f.4.2024.10.18.08.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 08:39:22 -0700 (PDT)
Message-ID: <3c93eccf-d7a3-40a8-83e3-91daf2d30e37@linuxfoundation.org>
Date: Fri, 18 Oct 2024 09:39:21 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftest: rtc: Check if could access /dev/rtc0 before
 testing
To: Joseph Jang <jjang@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "shuah@kernel.org" <shuah@kernel.org>,
 "avagin@google.com" <avagin@google.com>,
 "amir73il@gmail.com" <amir73il@gmail.com>,
 "brauner@kernel.org" <brauner@kernel.org>, Matt Ochs <mochs@nvidia.com>,
 Koba Ko <kobak@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240524013807.154338-1-jjang@nvidia.com>
 <20240524013807.154338-3-jjang@nvidia.com>
 <202406201937464fc96b1c@mail.local>
 <8c92ef18-6648-4348-9008-4f646d8b6956@nvidia.com>
 <05f24dbb-cfe6-4a75-9382-273c9c734b22@linuxfoundation.org>
 <202409241931048861ee5b@mail.local>
 <a9e43219-a4a7-4b78-8c03-c8deee36befb@linuxfoundation.org>
 <de127207-40ff-4c9d-bed5-37592de4123f@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <de127207-40ff-4c9d-bed5-37592de4123f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/24 22:18, Joseph Jang wrote:
> 
> 
> On 2024/9/25 3:57 AM, Shuah Khan wrote:
>> On 9/24/24 13:31, Alexandre Belloni wrote:
>>> Hello,
>>>
>>> On 24/09/2024 10:05:43-0600, Shuah Khan wrote:
>>>> On 9/23/24 23:37, Joseph Jang wrote:
>>>>> Hi Alexandre,
>>>>>
>>>>> Thank you for looking at the rtc patch.
>>>>> I saw you Acked the [PATCH 2/2], not sure when could we see the patch
>>>>> in kernel master or next branch ?
>>>>>
>>>>> Thank you,
>>>>> Joseph.
>>>>>
>>>>
>>>> Please don't top post. It is hard to follow the thread.
>>>>
>>>>> On 2024/6/21 3:37 AM, Alexandre Belloni wrote:
>>>>>> On 23/05/2024 18:38:07-0700, Joseph Jang wrote:
>>>>>>> The rtctest requires the read permission on /dev/rtc0. The rtctest will
>>>>>>> be skipped if the /dev/rtc0 is not readable.
>>>>>>>
>>>>>>> Reviewed-by: Koba Ko <kobak@nvidia.com>
>>>>>>> Reviewed-by: Matthew R. Ochs <mochs@nvidia.com>
>>>>>>> Signed-off-by: Joseph Jang <jjang@nvidia.com>
>>>>>>
>>>>>> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>>>>
>>>>
>>>> Alexandre, I can take this patch through kselftest. Might have
>>>> slipped through my Inbox or the assumption that this will go
>>>> through rtc tree.
>>>
>>> I assumed this would go through your tree, this is why I didn't carry
>>> it.
>>>
>>
>> I will take it through my tree then. Sorry for the delay.
> 
> Hi Shuah,
> 
> Thanks your help.
> May I know when can we see the patch on master branch ?
> 

Did you check the mainline:
This is already in  Linux 6.12 since rc2

commit 1ad999870a86d58246b6a614a435d055a9edf269
Author: Joseph Jang <jjang@nvidia.com>
Date:   Thu May 23 18:38:07 2024 -0700

     selftest: rtc: Check if could access /dev/rtc0 before testing

thanks,
-- Shuah


