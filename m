Return-Path: <linux-rtc+bounces-4686-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D08B2499A
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 14:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F04901BC0547
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 12:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEF929DB6A;
	Wed, 13 Aug 2025 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pD2miAJY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF7374420
	for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088625; cv=none; b=Mz6OAEYof7KSpDnFf/hzoAuYQIZ/QcKaVJh/b3sjPQ1qgsHM577Yxl1InhmAQ1g8uf3Tv6byBcZ+tEpLCgUgokXq0k7qSbs7AzPOTD7eu6TdEB4D0jFB7X5e+wkuzI4U8gjz49mOmReeFccsV65qcuHHUUDF6tpHTT9x6ub9WjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088625; c=relaxed/simple;
	bh=Dio7h+uqlbgU4biS+L4BkekXjii6MxHsEIflkjyhoZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjMKKfYiEhn32aYEANZlRwPyX+pfo6OqpWzTZzshUVf/i3t/+Zxav8eNKo/PQGlbNTx3yci3cPPV8lUBalSxaD7jIoQFi65KftpQ+ZLDoPLGRWBcdKK6BHcjAgyflKUNM/WpPeG0p+mV+RadmkOmY5vnqZwnZWgRR84tiRakkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pD2miAJY; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-881833b7adbso459631639f.1
        for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755088622; x=1755693422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJSNE7TDIwDdVBJivdzquzFfOdkEAZ/NqbU/Si8oVJo=;
        b=pD2miAJYs2q425XHx+ErrycxYy0aWLorgV+N+BEtt3PMXn3QTBQc/Ah2lGcPD820qB
         E74DBg1bPByO5HSYdhTSwYD8bLUEOJbDQ8e2jnpIxNCtYRhEbfo9Ix2NstSBBhnBZNGZ
         WXznnvJABFi6BtCd7FMr9GLHJRXQtW5SPUrTMGlIuSnKIKYS/yTJsFRUGaxROJV8BnxB
         Xqz4eBXVQvTghFNh36w7NyujD/mC72zb1456B9zuk2Ga4ljDPb8Qkc1D2Wp3BpZj83eC
         NHoCOcwXtoo03WoOygHQxYbRa+JDrrGHjBxXfWDr1UtYeyMDwEyWqIUHHQe+xmxfoBWl
         TBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088622; x=1755693422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJSNE7TDIwDdVBJivdzquzFfOdkEAZ/NqbU/Si8oVJo=;
        b=ZToUcC6cAncoeJ6tVkq5722cSrPnp39a1yv1h5S3SVP5n+ofeW8QV7tz5ymwEYyCJG
         4931b/5y5wJZ2XqnRyLKrAjnPXt0cmCvPU6WP0thCA5bY/LT72bUF/5ehw6ojD5lIodT
         VBwGD+tRXkmm/Gb8UzPJM0CtGB3UDzZrYyAHzgYAwe5aaKdxxyLe4tLaVTzwZWMEUE+0
         VYveu3Wi9MnBY5wlPiY+k4yPAOFhETK9u8d+2mVH6bhBM+bnBvttEILveIO9BBscJQba
         SnvaaLUwmbpuqDo2fVrvx3q7MciUd1ADwdpaD2ZNHNf26Agw2GGgzm3MaG/BlB39t6Yz
         f6HA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Kwhosn9Vw1Nlgra5Ugnpk3+92W09fRl3L3++TeP8xMTprqvEQTPcIqhFtRDTAnE8aOsn6hi/1Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcrfe/ZBXmUdwL3LBSEoa2+QJOZPN1dGcM2Tflx2ZS1NI1QHTu
	am8TZw9fAxalEomKY2Jm53Dgt3SE8447Tl//hfrMg3PwOaHht+U4F9GHU4qJ9R2TSAM=
X-Gm-Gg: ASbGncvCt8K7Np3ZsMOVdX48e7loyVPL1LidzpS6lKe0cUqKGxQWrEplefQ5sDkd3ez
	2ncGEPlmNgszn6u70FvCGERfZ5rirTg3ChiB0bxG5wjblGQdh/FtJ/8piC+DGSGMW4iCX0MzolJ
	CQAOaK6rcJndrZEGLI9YOHL0HA+66mhkQ78MfOcXJRthcS3UpEX1cwdDcF8fNprCyCqX7fGl/0+
	6ie5NDY0Wh6SvgdHzvMznSyBTHdE8vdEKlP+sBZU0JPPvZpHHCfHqGzl5lR/+MwZNAXCJ/M5H/8
	nSUDCxNbVnVCCOgJgTlScaPM8ukLuRAXTg2QZeJRd1q+Z4ScKxk0d05F+bXouKbIZmOMP6SuOev
	dn5tdoNlMpAsQSd7YeTZFOf1cCsiuKxdCxbyd41glW2riCo3LdCMmf0VPgwaa5X9MCxcsdOoF
X-Google-Smtp-Source: AGHT+IFnwEFQtUPVw9g9mmFiyfGLoS5nlr8HAUmqQnFfYA2GdWoqbZqkoS/L9fICYJiWR+VCb+vYyQ==
X-Received: by 2002:a05:6602:14d4:b0:881:7837:6058 with SMTP id ca18e2360f4ac-88429514720mr521566239f.0.1755088621539;
        Wed, 13 Aug 2025 05:37:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-883f19c1475sm445898339f.29.2025.08.13.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:37:01 -0700 (PDT)
Message-ID: <fd7ac07d-030c-41d6-94dd-da53b593f5ab@riscstar.com>
Date: Wed, 13 Aug 2025 07:36:58 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1
 PMIC
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-2-elder@riscstar.com>
 <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 7:19 AM, Troy Mitchell wrote:
> You can change it from this to my company email:
> troy.mitchell@linux.spacemit.com
> 
> Acked-by: Troy Mitchell<troymitchell988@gmail.com>
> 
>                  - Troy

I will make this change before I do a final version.	-Alex

