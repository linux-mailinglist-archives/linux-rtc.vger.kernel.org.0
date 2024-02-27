Return-Path: <linux-rtc+bounces-752-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEF86A39F
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Feb 2024 00:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916861C256B5
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Feb 2024 23:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303D758126;
	Tue, 27 Feb 2024 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kh+uxOPi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2720D5789E
	for <linux-rtc@vger.kernel.org>; Tue, 27 Feb 2024 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709076304; cv=none; b=UoAcwz4+qJfr4GR/jkIk5uoZIaLXgiZAZ19WJ7CxrrsPZwqSgCaIeTaCrt8FCUdhIbJfWU/18BUCZMbhk3ZhLotvOLI4rmg+SWXnKhsbtY069ExKIJhTQMM0bHBXGlcSyQP10gkKe83k4djPCdgh+PYuNo3MAiMFCxmbA/fC+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709076304; c=relaxed/simple;
	bh=HDwa7fbuH1aZDEzp5Ac6iY2RB5pkOpyq5qK/4yKHkbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GV57NntLhOC2m8J11wRTIVaEYM4GTZVBGQtsWEXGgDGyaiBXLCPd/J99Spznp5rrnQLkVSoU55KTlm6o0lrSM4H26n6RNP+8X899k+6tbri90yf9R7zeFYl4Km2iMO8KKG170IXY0zgcLuNZOB4l/ReBLnxT3+7P1/xaEnpdr/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kh+uxOPi; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3651ee59db4so1083115ab.0
        for <linux-rtc@vger.kernel.org>; Tue, 27 Feb 2024 15:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709076300; x=1709681100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvIY3k15tE0HcJm4Yzmaclwism7ZYGDgLaZ5F1IOoes=;
        b=Kh+uxOPig0hkA0IOU0u2kAKdbxe+m8QAosuBOGvLzIsQn66kAy+K4i+PRVs4JPHw07
         fgQYU/A+NjtIeojqksBpXmIleVIbSvCV54M2CqvbAmyFFgKbMb3PcWAj4K9RBebBC8Z5
         5ZuUTk0HfNBmPXJnxXd1gAHVfrn+MDDQ/ZAK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709076300; x=1709681100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvIY3k15tE0HcJm4Yzmaclwism7ZYGDgLaZ5F1IOoes=;
        b=I4/fQeg02ufTdKy4pNJK9e1wRaXUa4+WhGPPqOFk3UkfPTFvgrda9ELvSQS0djzTyZ
         oaT2WvDQ94E9KSygkyIMaXrR9G8oPXw3nB0Q7joszjicp7B65OiH3MWWCEt26Z/Udaa/
         1lJAj8T//unogFc1eq99Jt45+MFPIUpGd8onjV4NczCt46JZwwytZzHSmetjNhxNJl1o
         ngl3ReYoA/N8m4Bf0EEMm2QtYFi5zqtGsMTM51PzI+mZvYrAokJa4dZclZHI6qdgX3Fk
         b2sBe0AR/gx/uA51E1PKn/mgO/Jn71iI3b1dcX/zMz3+aMmYZkiMncfD5Pu5kYt2epok
         ZsuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtD/+bbAypeXHb1yO1aPUQQne+5cuD49lyL1tlou5fkgS7+AlRubeTarvdEnU7StrDsMdJKrpgQu3cXj9+Ri5oe/wYCKVj6pNf
X-Gm-Message-State: AOJu0YxFdKH+LnV1cGgEgir8B0e67qvx+gmlJ+60ce7tzbaQqeedk9VX
	5KbP8pn09vWk514DNBrLRSqhsS9REKwyyHmsLi8rlqX5gAoLjLjeeQfn0Ednvx0=
X-Google-Smtp-Source: AGHT+IH7h7vSS9kJq/Hsu1hvzmsVL1Hoh2ZLb1ktpG8OlizpzOEJEClNfjMsljDl+J9cw2Cp6ZyxBA==
X-Received: by 2002:a05:6602:38d:b0:7c7:8933:2fec with SMTP id f13-20020a056602038d00b007c789332fecmr10945119iov.2.1709076300126;
        Tue, 27 Feb 2024 15:25:00 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id q10-20020a02cf0a000000b004743021012asm1964451jar.2.2024.02.27.15.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 15:24:59 -0800 (PST)
Message-ID: <ba023321-dd6e-4163-8924-092c87aa17fc@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:24:58 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
Content-Language: en-US
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Justin Stitt <justinstitt@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
 <20240221212952.bqw4rdz2i2yf3now@google.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221212952.bqw4rdz2i2yf3now@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/24 14:29, Justin Stitt wrote:
> Hi,
> 
> On Wed, Feb 21, 2024 at 05:27:20PM +0800, David Gow wrote:
>> The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
>> which was then updated to be an 'unsigned long' to avoid 64-bit
>> multiplication division helpers.
>>
>> However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
>> '%d' or '%llu' format specifiers, the former of which is always wrong,
>> and the latter is no longer correct now that ps is no longer a u64. Fix
>> these to all use '%lu'.
>>
>> Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
>> message. gcc warns if a printf format string is empty (apparently), so
> 
> clang does too; under -Wformat-zero-length
> 
>> give these some more detailed error messages, which should be more
>> useful anyway.
>>
>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
>> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
>> Signed-off-by: David Gow <davidgow@google.com>
> 
> Reviewed-by: Justin Stitt <justinstitt@google.com>

David,

Please send this on top of Linux 6.9-rc6 - this one doesn't
apply as is due to conflict between this one and fca7526b7d89

I think if we can fix this here - we won't problems during pull
request merge.

thanks,
-- Shuah



