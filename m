Return-Path: <linux-rtc+bounces-2057-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A121898493A
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 18:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5740928616F
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 16:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4671B012B;
	Tue, 24 Sep 2024 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aDsJt7w5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ECD1AC451
	for <linux-rtc@vger.kernel.org>; Tue, 24 Sep 2024 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727193949; cv=none; b=VrHiynyxnSEIo1R9RrzPXfCxfHObQtAcOtlw60ENRWoyL5aIYnXYXHp7pveh6CAfCmbV2vJog7pVHztFe5+YXwGIzB9Iqq7LOpE7Ws4bq7xexvqfuJDtFW03iJHtA6KdU1odtdL5+Bi7x7J1iosx7EjBgbFoLxE6dBS/ZwEjOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727193949; c=relaxed/simple;
	bh=nQQTZtX6roW+dxYDtbGKL2XfIHd9IcnhpKNBQ/mM4sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8RHeaKxwAnO/sOb3MdKk3JbdwWBmPja6QSbHRsjeUDR6BW8+pySUda2alyp6laFsqFquRVuuQmgQ8LYPO26MSsOu96QZcgBHCFeM1fo2T/cyr383AGb3gV1yDsKfnmG/pFMKddn33WJV3GJp4U4I/UBGyMHC3VXp6tD7WIicJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aDsJt7w5; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-82cf3286261so212596439f.0
        for <linux-rtc@vger.kernel.org>; Tue, 24 Sep 2024 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727193947; x=1727798747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGgZC++q2AtpmgeIvTiFEAi7y/z7fLmypkiCbl8bJao=;
        b=aDsJt7w5d9h35SWMTWffR5560CMLtzic7xKjKbV+6bLyx2x5YFD+ADl0PHAepFlIPD
         J/6aAWRC73ZbjshLOwq0vRZ1+xRR7cK6+aenp6SlwH6/ZS1RyM9e5K9Ql/Stu6xzQTe2
         2CL5qcS6cIDVXBnL8DYhCISbBb8gZzuLlr9zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727193947; x=1727798747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGgZC++q2AtpmgeIvTiFEAi7y/z7fLmypkiCbl8bJao=;
        b=EIcdJEQ7SBay2ywIPhJnuL5TfCrbB4lfAow6jJ3NYQX7h/pzihxLujuIbeX/44KHkj
         Ghlpq/5349/jH0CheWkoFzr/cPO3WNuFT3DTCx9x92Hzh3cGaRI/2yHfjcleofysHemc
         W3r0g4tzkiRxmb54Pao6p5M232plsGTEQ/GQenHyaqaa2TvyPAONBzgWzLWqxx37Wlrl
         rf/6TI4FKU65tF3qgzHzkYe9fJ//NOsLfjFxGjMo2IlVHu7SEDouF8Rp/kXBtuhCRSzZ
         PhFUC62AuBzzOns1oseRDLkNz27eSnUHVnkO0kZlZ5zLupnLp7xkjj1p0IvTlPZaHli9
         l7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX67su7ob+ZpKtF0LUZAGhQ/jzf7sWCm8eBMG6FD+zLX8uKf2SCSFcoXOYF38b+fL8bg4SUK28I+Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5W5sWbVZWmbreIJojUVOFcQzS0vVZ+uM4DmXwCQ8vq5rl3AI
	HQ3k3gv4zusL0g3WQlUN3paSEO5sL5b/XxMhII754nQzi1RRFHwhxgjA0+yjl+s=
X-Google-Smtp-Source: AGHT+IG3L22c5EIpJXprkBEjnN4zhBqDpV3boF4+NP3bngxIQ6cQR4CJBuuc7PHkPDw7nlC0RNP3Xg==
X-Received: by 2002:a05:6e02:194d:b0:3a0:c820:c5f0 with SMTP id e9e14a558f8ab-3a0c9d90ba0mr145533015ab.24.1727193946584;
        Tue, 24 Sep 2024 09:05:46 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a1a5713af6sm4633385ab.60.2024.09.24.09.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 09:05:45 -0700 (PDT)
Message-ID: <05f24dbb-cfe6-4a75-9382-273c9c734b22@linuxfoundation.org>
Date: Tue, 24 Sep 2024 10:05:43 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <8c92ef18-6648-4348-9008-4f646d8b6956@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/24 23:37, Joseph Jang wrote:
> Hi Alexandre,
> 
> Thank you for looking at the rtc patch.
> I saw you Acked the [PATCH 2/2], not sure when could we see the patch
> in kernel master or next branch ?
> 
> Thank you,
> Joseph.
> 

Please don't top post. It is hard to follow the thread.

> On 2024/6/21 3:37 AM, Alexandre Belloni wrote:
>> On 23/05/2024 18:38:07-0700, Joseph Jang wrote:
>>> The rtctest requires the read permission on /dev/rtc0. The rtctest will
>>> be skipped if the /dev/rtc0 is not readable.
>>>
>>> Reviewed-by: Koba Ko <kobak@nvidia.com>
>>> Reviewed-by: Matthew R. Ochs <mochs@nvidia.com>
>>> Signed-off-by: Joseph Jang <jjang@nvidia.com>
>>
>> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>

Alexandre, I can take this patch through kselftest. Might have
slipped through my Inbox or the assumption that this will go
through rtc tree.

thanks,
-- Shuah

