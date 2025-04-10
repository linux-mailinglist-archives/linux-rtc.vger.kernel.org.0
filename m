Return-Path: <linux-rtc+bounces-3892-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5CA83893
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 07:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8BC43B6357
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 05:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48291F1311;
	Thu, 10 Apr 2025 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIhiZ0FB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC216F858;
	Thu, 10 Apr 2025 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263919; cv=none; b=eyCd4fIS5wnFtGtJJtq7I6H4KPN7X+tUfkyGxLBbXik0wMOLrkySFPQ6HWZBrTDlVA7/k+8pQlFnWfzLsHi3q7oH4ILx2lEuDuHLr4LNXw3Ymvd4u2TBhfC+mwZg4iS6N8kqK2NWZYKe7htLbpHi6DizBGwySDycxUX0Vov7FvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263919; c=relaxed/simple;
	bh=hyhQWbvvY6aZDWGecgECnU2XiZensqO8oW8ktfacXz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0BSfaMn8C72+PVZXTo5F9zZgx+JfnE2Y7clrIIJ0XAK2PAqnk+Aphe/nwrecLvVhd3wNtommRm9xCEc/3UYFwMmx/IlCP5wqVBEge+yUkW+qVWPQXZaHwGuwUYYNx7VojJ7i20SwOQhA1abPT2KqnBgcp6eCLeOCCKbN8rmda4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIhiZ0FB; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c55b53a459so51732585a.3;
        Wed, 09 Apr 2025 22:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744263917; x=1744868717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnBvkHnjo38Z4sQgkh/340/KUHasIb+bKgEKZsCRewM=;
        b=cIhiZ0FBDuuEzVlyNGF4g9QCiZZkuJvKV6NuzXL4hDcpI4Il212RupqzdHy7Trc6Wf
         Bgm4RJaOOlyU6twJ7+aR+M9Q04r7yBoCohkpAZyCcKQmEbMB+vUvAxmHUjUZh946GHiV
         A/wN6BYU2CLpJ0qJSheFpaBu4DZCZZi5yzZbustATiulB3Xabqzwe3qsqQkCJQBgtL63
         2B6itbeyHpMq6IlZn8zzbao6VpTB7b7CoKQuKHsZ8Q7DmDkr+mhckU3z/1PcBQ7zNweh
         qoQBeCoJeRkW2H+ptJTX4nNneJf+1x7gASZhki3G5F72LShbNJlKkmAO6ciW7Oh4vJLF
         06VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263917; x=1744868717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnBvkHnjo38Z4sQgkh/340/KUHasIb+bKgEKZsCRewM=;
        b=Lchb0KqiSFHPNRI8dRzXT1XgoUCNFFjk3YtMhChs06qTLV6GA9h+jQxQ6OnsmJNFoh
         2iNNOPh8SN6yUId68hr0JL9LA+aXThEIa9NbKNoukKI/nW4k+jWBmMUWAWhvnAOfY7iK
         rM+HLMYVtqq4HlRphjy8KnEUokWc2O9/q4m6XnFnLthQd/l2pPvN0wfhd1bvRkSj2qFo
         3bHbu2HnOLpk7jwlhgp449MlI76kckhyfo+DQSXM1yIafqQbGD3x1IMWPD/Ys9uYbhSt
         T1XTdClIII3xoC95xulKmvBMmmAbSpO5Nr5CsGe7h/RxA9sEcBfNiUHufTaoA6C7oAZQ
         Vthg==
X-Forwarded-Encrypted: i=1; AJvYcCUrDKFhKe9DMz1eW+9Li/5/rFEpqlh3Z8oBpXY7BJs0VByAtgva0t2WXb+o2Hl0YX5Dtjwy3wrLB48D@vger.kernel.org, AJvYcCV63mOJnNGjahFVeCIimPcDBUNsE9+EJ5Rmyvi0IcHo+NLY+vZCHiOkAsZhotjVS2PEGkpYUrs1MEF0xjNx@vger.kernel.org, AJvYcCXakDuoDVb+kzQ4M/B90vCAYOHX1gIki+VekL9/5HdxjvXeZB4N7gZ2PSDsryQeNn8NdbeZDEgY9+gv@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcLqiQt4oO+bXSO9qfWqHyclzF2s7o+UWUTlRBrMqT/zkVY+1
	i+AQ1sQMG9SBApKjWPRP0sQNLPnRqh0LWq9PdWcHD7wBlG3JHm60
X-Gm-Gg: ASbGncvI+/DrQb51CwDpf8X6ifCHOL+ubUY75NHsXHeEXD9blx0qNRChPT6Sv250N0D
	5AN/FOr/JcttTUOHneVqQ8sFD+Py98pRPzRdJJkgXsHN9eAbUzDhxByHacrj8VqMj31AC/Oo8eu
	cO/M8/KGu5TPmcc3gI4zg7i3rU7a3sApD5ngTjSWsUMmCHXO5OCGUMDTtATN6TglviZBL52U6LK
	jmv6zP5bZHOoN9aMoiBV4k/9qyPgAANNG5oWYU1IOa3KkFQYV+2cfXrlwGQxIj2YD4Jgfuapt3G
	OJt47YdjdqrxYC2lkqXTYSwYwlE=
X-Google-Smtp-Source: AGHT+IHNoZEz5x3zmUQjybBNrxVpd4osnT2kTmBT1dz8XQJi1JxSOi4Yd2pHHUYeeBMJWuCz+52zyw==
X-Received: by 2002:a05:620a:4154:b0:7c5:a424:1f67 with SMTP id af79cd13be357-7c7a816d0f6mr119973585a.29.1744263916967;
        Wed, 09 Apr 2025 22:45:16 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8a106easm38536485a.113.2025.04.09.22.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:45:16 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:44:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <aczljpyu56po7xkhqjjelatfw5l6bpqskvd3jnl4muy4pt3rjj@5q6imbmcqng2>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315224921.3627852-3-alexander.sverdlin@gmail.com>

On Sat, Mar 15, 2025 at 11:49:13PM +0100, Alexander Sverdlin wrote:
> Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> machine to control chip power-on, power-off and reset. Furthermore, the
> 8051 subsystem is located within RTCSYS including associated SRAM block.
> 
> This patch only populates RTC sub-device.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v14:
> - Dropped MAINTAINERS F: entry in favour of the existing N: entry
> - mfd_cell name "cv1800-rtc" -> "cv1800b-rtc"
> - Removed Cvitek brand from Kconfig
> - Not built by default if COMPILE_TEST
> v13:
> - Moved the driver from MFD into SOC subsystem
> - Dropped unused "cv1800_rtcsys_rtc_subdev"
> v12:
> - new patch
> 
>  drivers/soc/Kconfig                |  1 +
>  drivers/soc/Makefile               |  1 +
>  drivers/soc/sophgo/Kconfig         | 23 ++++++++++++
>  drivers/soc/sophgo/Makefile        |  3 ++
>  drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
>  6 files changed, 93 insertions(+)
>  create mode 100644 drivers/soc/sophgo/Kconfig
>  create mode 100644 drivers/soc/sophgo/Makefile
>  create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

