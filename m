Return-Path: <linux-rtc+bounces-736-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6586A197
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Feb 2024 22:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41DCE29027A
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Feb 2024 21:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0492E151CD9;
	Tue, 27 Feb 2024 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fCuVw/I7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1900150981
	for <linux-rtc@vger.kernel.org>; Tue, 27 Feb 2024 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709069014; cv=none; b=NyY/r6hjUCLdlMambagptJsHui3pPyNGXwxN2NBllekihFtF8jg4Dk06Hfx8Ff0Jk4x9AaUE4n2mxy09PpdQcQDcPRNL80VkgOpL0k5uGk8DbwDT3zgTabKYyytulaYum1Bosmo6KMsnvWP/4h40PbkdcYfsu0P/xcxV1wdjdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709069014; c=relaxed/simple;
	bh=x0k9KPWxpMjPpZo+FkyIevXhBqRIFk50MHuqVr7KDaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOQMOOXNK2G9kxxd8poeUn8Z/+EVM2XlV26ofmAsQKNuzvOaP+Lwn4Qp6Hpy6KPE7zxP24m2/xPboMUYC4oiPGITJEHygJ1IlKYWz5LUe8Yom+BzD5yqJ/ByYxWEQt9nOpYX9h1tH6c6LBvZVt2g+UKtpFOXASY6UU37R7fjpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fCuVw/I7; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c49c979b5dso96217739f.1
        for <linux-rtc@vger.kernel.org>; Tue, 27 Feb 2024 13:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709069010; x=1709673810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbGdkLlpvK16N0hfZoWh5Gw9/QwXnepLBQjOEcjQHHM=;
        b=fCuVw/I7vLxxfe0MahEu64iSxVc5OvwzmUSYxEfdgYv+Id0K4EIMqBCEOHyB3WMOiG
         IW/M9tP+ei13A7hMEvEv+xe/8wjk+HH8YKXOV3XTh9BrPBVJn7RqEqFYUcoOaQVXnSpk
         zykMpyGf+n0EelMizLEjYEgqxvBVnQxs56u7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709069010; x=1709673810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbGdkLlpvK16N0hfZoWh5Gw9/QwXnepLBQjOEcjQHHM=;
        b=CLT6rMLBxmi9f7Ih4c38gJka1/YHG/NmrJ79+FGfx8hPvt8YKMEOdyJkuADamjYIjP
         JjrwFFlUnxZIu6vPcLy24BHK08KBYfBZKVETXjHlZ62ksTqZKRIsIlBpqiZEkpW57TEQ
         kzPOzdEfqHDaZKmDu76ND4vEfFKIc6UDGAmzmLaCDHMErazbDabo5SxB04QAjylSRwVL
         zyKmbaM4fNb52GezTj6H1yzz4a+wta02XLcfD790zBbENO1jdHrMmXcOu72PSHjIgDgG
         WhhpNE8J+oHUtEeMMz2Xvr697+N3wzX4vxxlwMOyO06D7lqh077v+gJbREnakDo2aUho
         cQrw==
X-Forwarded-Encrypted: i=1; AJvYcCVyMySGDUw1jD+8d0ErMQda6I+YNNmRKd9TTK/+Ni7Tp2IhYWY17l3sg2e+pPcMsQUlAO34U8mTm+rVFQeZTcgch0VOBE/Yj/Zj
X-Gm-Message-State: AOJu0Yw+n/gP0spBUNaxpiYvsFAzWWmnQX9mN2QrPTqcbENz0nM8ir8z
	IuAOJX0JjIje6VxCZZybzzb5WzjY88G21DeUlekk28iPv/R98oZFXRhRyqg2W20=
X-Google-Smtp-Source: AGHT+IFc3RgJRdGVkP2NPs5Y/GfM+e2c3LeD0bxO2noPvCmHIWJaDhFOLsvOZQ0IljP20IzU/UY25Q==
X-Received: by 2002:a05:6e02:214d:b0:365:3fb7:f77 with SMTP id d13-20020a056e02214d00b003653fb70f77mr11217673ilv.3.1709069010744;
        Tue, 27 Feb 2024 13:23:30 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id bf19-20020a056e02309300b0036524b8c632sm2413353ilb.0.2024.02.27.13.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 13:23:30 -0800 (PST)
Message-ID: <56680d34-59f1-460c-a835-f1258abf4569@linuxfoundation.org>
Date: Tue, 27 Feb 2024 14:23:29 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] rtc: test: Fix invalid format specifier.
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Gow <davidgow@google.com>
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
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-6-davidgow@google.com>
 <20240227203243070e7d85@mail.local>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240227203243070e7d85@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 13:32, Alexandre Belloni wrote:
> Hello,
> 
> On 21/02/2024 17:27:18+0800, David Gow wrote:
>> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
>>
>> This was found by extending KUnit's assertion macros to use gcc's
>> __printf attribute.
>>
>> Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
>> Signed-off-by: David Gow <davidgow@google.com>
> 
> Who do you expect to take this patch?
> 

I am going to be applying this series to linux-kselftest kunit next
in just a bit. Would you like to ack the pacth?

thanks,
-- Shuah


