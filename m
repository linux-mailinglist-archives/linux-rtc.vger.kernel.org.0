Return-Path: <linux-rtc+bounces-718-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5FD85FB1F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 15:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A771C24388
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Feb 2024 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5F21474D4;
	Thu, 22 Feb 2024 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tq6RPqfI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB7C14600E
	for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708611806; cv=none; b=TjtLni+XbTOjLuWVd4MAHuTAlhhPtf8gafpgcR8RnCmK5K2GnFZmze/DhgWShtsEKKodYbxMAb4/a/aJpGK8Lgu9KaFTmMpgNzQ/koZr2qDJZQyAyQWdUmD7RtNdfY158qRzi20+cftxmyRfS2BsRjKlDnKv/sgFH4afMnCZnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708611806; c=relaxed/simple;
	bh=Mp82jeP2ujByGkHzqK9TDgR5FlKS5q+5jbi8/ebGkm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aelTd8Hk9cOHkui7QuNLU/MkJajpMml/4It9xVGOHrHsm4MMgt6U+gjIqBRq4ZsDL5R/2PR/XNGDkQqs3iUnZoXuGRqpoSQgVRlYK14MGr63bucBuzGnkK3QfYXncYCDT2lehGTXxsB4gaNO1Nbskrmrt2GnNWISBGYAzXUc/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tq6RPqfI; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7c00a2cbcf6so61710439f.1
        for <linux-rtc@vger.kernel.org>; Thu, 22 Feb 2024 06:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708611804; x=1709216604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHaXxIxgBTJmgtue73WVl6b/Cy0dVFZjoWVjGUpCh3I=;
        b=Tq6RPqfIaQmh5ZS+wBv4yfNUt1zEHRHki6eMjLz9R2NHLK0U3S8TLpjW25w/TFXaL6
         87ayYSQ9hg/ZEdUTueKu3Ji3YscQfR7j7B+DmUoKwbFheK1USW28nHEVIWSoS0kXTZei
         Y4bksQlbo9mCRcbLYTwWP60UkmU7/dP7UeWmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708611804; x=1709216604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHaXxIxgBTJmgtue73WVl6b/Cy0dVFZjoWVjGUpCh3I=;
        b=r0sVtcgXv5cUUHhTTZ0jKOjIIvrVhmMnkYQ1YDRj1CoPKl8reHIbKPWZoDdYZ1EeQA
         9ANeDZpKU68LjYu0DeAcq4Eb03Jvrz8Bg61RU69sleuoWSh0bV1FkZGcVNiaVXsLP/iV
         82qBMTIejBZ/ZjdyIBbJJGBE+Ri+VRKcFaS/Fe4ydVuEJijxueDqbvCg0VYmFPWwZIFI
         eXejfXyF2mnVeWDjGiKHKavfSYb7Q/VunvO8yc1rmg2h8yb/92m771nktnq0CjVyuxDo
         usaL9Dpg9VsVFnt6nNYt6FCxe7cKMyiFS2N2Gq2p9Zek6VpW0pv7Xhey9aT1Fukp/Zd2
         MMag==
X-Forwarded-Encrypted: i=1; AJvYcCUT2vHvfEzuMIhN7bkx7t+BIkrRkZUtHwqoDgKx64SedXj4QkjgyqqJL5YExoSYQZQnIIDECG9mwf2L/Y9a9IpJGpmoFv1/6uNi
X-Gm-Message-State: AOJu0YxYqrhBz5IthbIKyIyoqsWea4O/R/BtGYv1RaDjYJyQWCzF85zI
	PT1BJFNPY/Iv0sJ5hFG+YIl+d0JvyvsJ62v2LmYRXRYvlSP9zbjCN0VJANnWJ+c=
X-Google-Smtp-Source: AGHT+IFae9GfHftZi8zK41FezlChjHIL0jhjWV8Bs/s6McEy9uQqRVDUnPsC8m/z1HG2Wc+9hRWIVA==
X-Received: by 2002:a5e:970a:0:b0:7c4:9ed9:8e7c with SMTP id w10-20020a5e970a000000b007c49ed98e7cmr17459202ioj.0.1708611804205;
        Thu, 22 Feb 2024 06:23:24 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id w14-20020a5ed60e000000b007c75a3c0184sm1834078iom.9.2024.02.22.06.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 06:23:23 -0800 (PST)
Message-ID: <d0c81ab8-b404-4710-9b27-71aede157b3b@linuxfoundation.org>
Date: Thu, 22 Feb 2024 07:23:21 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] kunit: Fix printf format specifier issues in KUnit
 assertions
To: David Gow <davidgow@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
 Arthur Grillo <arthur.grillo@usp.br>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240221092728.1281499-1-davidgow@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/24 02:27, David Gow wrote:
> KUnit has several macros which accept a log message, which can contain
> printf format specifiers. Some of these (the explicit log macros)
> already use the __printf() gcc attribute to ensure the format specifiers
> are valid, but those which could fail the test, and hence used
> __kunit_do_failed_assertion() behind the scenes, did not.
> 
> These include:
> - KUNIT_EXPECT_*_MSG()
> - KUNIT_ASSERT_*_MSG()
> - KUNIT_FAIL()
> 
> This series adds the __printf() attribute, and fixes all of the issues
> uncovered. (Or, at least, all of those I could find with an x86_64
> allyesconfig, and the default KUnit config on a number of other
> architectures. Please test!)
> 
> The issues in question basically take the following forms:
> - int / long / long long confusion: typically a type being updated, but
>    the format string not.
> - Use of integer format specifiers (%d/%u/%li/etc) for types like size_t
>    or pointer differences (technically ptrdiff_t), which would only work
>    on some architectures.
> - Use of integer format specifiers in combination with PTR_ERR(), where
>    %pe would make more sense.
> - Use of empty messages which, whilst technically not incorrect, are not
>    useful and trigger a gcc warning.
> 
> We'd like to get these (or equivalent) in for 6.9 if possible, so please
> do take a look if possible.
> 
> Thanks,
> -- David
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/linux-kselftest/CAHk-=wgJMOquDO5f8ShH1f4rzZwzApNVCw643m5-Yj+BfsFstA@mail.gmail.com/
> 
>

Thank you for a quick response David. I will apply the series to
kunit next for Linux 6.9 as soon as the reviews are complete.

thanks,
-- Shuah


