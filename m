Return-Path: <linux-rtc+bounces-3893-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FDA83895
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 07:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115F4464FAA
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 05:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCFF1FC0FA;
	Thu, 10 Apr 2025 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs3J41OR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1215A1F0E56;
	Thu, 10 Apr 2025 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263941; cv=none; b=tDrwJRJjYZ3IBv67VN8cn33DtFve7NhiQxd6MVffqLr0yz59J7jeypZo2sPa2A1+6527GwQkyscG/FeHup3A7jFG7O8U1h3ejeK1C+tBTs62rCxYLD7uIx2Rz0MbaLU9PXE0/mSfA9GPT697JTfoDNklJtBWPZ0Afv1k8ty2HoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263941; c=relaxed/simple;
	bh=jHaEtzQVLOQhENDlIGBE0r9XR/xjh2shXjUrdPBQg3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijH2JInAnYguR4Bt3d5MG4nSdVzFN2LiAFVUY8TUl4FIq5MHbobsfBjHcivfRcUXPuxEx0Y3zPRdB+VtWmHN6oLRGitZRuQRs2EnQib9hNE9Ud0R0NiFuQE/WjJAbSgRcmL0dzsFKYnoNbvnKZ+wAB8DvEzDOX283miU/E4pGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs3J41OR; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4774193fdffso5935011cf.1;
        Wed, 09 Apr 2025 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744263939; x=1744868739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dSDpt8yORaoTmILVfEV+qWHE1Kt5hrousefB2rwiP0=;
        b=gs3J41ORDR8+BTEgRIulOkeTb9Y3d/tqzyCBY4g2aQa4qQiZE634aVCaFBk6uTyDZU
         oKL1SP8+9Lo8mqd8nSZvvLwFFygguNCCmrAjEQO3Z9726gEBizvm6lZXabURE6XRL8xw
         rGBVAtgmdvhQHewjWBqdwNoprOjfMBgPHyOytqwmxgKzEicpmofv0HQwZzid9W/pazvl
         hqonELlWus+smoL07Hib91UVAtz3PDdjyBEGA4jE8mxwgYHpgTHBxqXp/FaTVTU1q9NI
         dNSnuKJtvzJCw6Ee9bq0n9b5x5A/PFJtiFoCvQw+IjjuXed/mzw1mYkfoFmJwDWeeOAb
         rDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263939; x=1744868739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dSDpt8yORaoTmILVfEV+qWHE1Kt5hrousefB2rwiP0=;
        b=EbOVQc+1Gx4cFYwSDr1+gHGuRijio5Opa1bdhqwk9My/9KOw4UZeQdOZqvNzNYNjdC
         afS6Air+0BAFiPG0v4upBYcVSnOJUE/n8D6uMvbx1Wdm3dsdQHsB3wQetiLstvTxqlZo
         wrhcbGmc2WrD+4YTWCI+ouQziT6Qy8J2FkIVHCYcx+cql7vEZZNZn7Mb4nwjqrB+aJEp
         e7cEfq56FD66VIkbylLYTwtyB6Q13AOEslPCA5dL+icOHn09INqDnitHaRG+oMGCvXWI
         WLqnJ3yMcCDoDNOE04KvSqxyKV4FOsChmn3Z5K8T7vfCRDSqw0sFpmAoabYENo/m8GOQ
         6P6A==
X-Forwarded-Encrypted: i=1; AJvYcCUQrQ0wpTRgam+miJzhEs1HfwfcMv7TYbpKYL4GIagPc2PMAe0QkNSO8SBV2hBNc5W20wnAp9FsT9nJeT6/@vger.kernel.org, AJvYcCVKeXWE0kkmPZYi3R5K8GiPtUNHgFuDJ/zknhkWS4egfLeMAOIb8KFAsnzZ4sasoRPsJanYDDK0g14u@vger.kernel.org, AJvYcCVnCiOqG0aulxDRXyxdFDKyFY/bZYuJ3pmXwSfHIfe/xbCX3DgnmWKUKZb0X3cNZbO4BdzcbNYQ3LBP@vger.kernel.org
X-Gm-Message-State: AOJu0YzRUBOCn1l9ZZBc1oMh4MwUwBMnXTCwLMh6enJihHmv9Aim+Gyi
	De6VetXD9tlcUhNEZhfPsJlpbhXGeNTJ12QuKd2MkKwSWPPt2E5Q
X-Gm-Gg: ASbGnctyIAcMOPmzdGxY2GHOtLkYh/vmIGYHuMhlDkSfRFGojIDp6awi/3iOApqWf84
	XJ7ndWYwkZd/4gUFOQ5NNJu+YKvq/nxQMz7+sbiK9o/zwM2Err3k/t84XLvDWyTLJNMH7utzIoj
	idGyzNwAw8dSNA2GycqdZfosmzfNkvo1XHg/23u7a1LOxOLhlLHSFW2KnMUdPQk7ypS5nh9EiXA
	+o0pW2PRHTa8/onf1zmQVeJVxFCL22w/P6tcZTukfFTi0iWgkKewAE6mL4R2OEPhL3v8bx8JwOP
	H1svvK52E9jNC7h+do0Zi0b2g/E=
X-Google-Smtp-Source: AGHT+IHWpkW6hRR/DBsksx6ZJqR4lJbOCUW1b2317akbtc9j0rn0qJX08BWWlLDmViJytQmHCxBIVg==
X-Received: by 2002:ad4:5f4f:0:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f0e5aa6ce8mr23639886d6.14.1744263938704;
        Wed, 09 Apr 2025 22:45:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95fdd1sm16451946d6.18.2025.04.09.22.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:45:38 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:45:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v14 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <3m3amtjnqcrice2tfxw2ky7f65u574yi7crmcg7j7q3tnkk3zp@k7a5alzdbffb>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315224921.3627852-2-alexander.sverdlin@gmail.com>

On Sat, Mar 15, 2025 at 11:49:12PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> called RTC, but contains control registers of other HW blocks in its
> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changelog:
> v14:
> - no changes
> v13:
> - Moved bindings from MFD into SOC subsystem
> 
> v12:
> - maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
> - dropped Reviewed-by: Krzysztof Kozlowski
> - link to TRM
> - mentioned 8051 core in the description
> - binding is now MFD, not RTC
> - added "syscon" compatible
> - added "interrupt-names", "clock-names" (because of added PM/remoteproc)
> - main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"
> 
>  .../soc/sophgo/sophgo,cv1800b-rtc.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>


