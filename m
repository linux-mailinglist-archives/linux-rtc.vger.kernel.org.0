Return-Path: <linux-rtc+bounces-5124-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC876BFD809
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 19:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92E664F56B3
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 17:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BDC274B3D;
	Wed, 22 Oct 2025 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZcvdQY8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7B27442;
	Wed, 22 Oct 2025 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152920; cv=none; b=DNU4jKyJTlGuiAdacG3xeixSonFRm6o8//nQLmniVLa1rIq2UDall+le9K4KMPi249v2Vk/gL9wkuz/I+qIxrNdx3NacwmenQ5DWWZTvb2BgW1d03bXZotk7KZcmFPjMcT+8aOM8tpvvO2NEFp7/YFPJjpDQq+xlPNLFccO6C4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152920; c=relaxed/simple;
	bh=p5UUeXRLpcoIUu1HKCCp9bDFN1i3zXm6jSbe0BZahCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA1wgAB22dCG8+sASGG5AgagwLEWrlWALEEnbtvCv88FsNfvf+Lu524jl2w2aioRm0QB8GARBBTQckmZEk2yy6/yfsBYjIvBnQHP0dVAD83aiBDeu/lo8ERs693BWpjWkzqUvnHxCPr2Mwg9poARLRMb1y5Uspd2wZAwidCIM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZcvdQY8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761152918; x=1792688918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p5UUeXRLpcoIUu1HKCCp9bDFN1i3zXm6jSbe0BZahCM=;
  b=AZcvdQY8a3b+QLSUN6Yt5lfS1L5hsoB0UTiw9nuqKFQr7H6WMs5oKnPx
   gwsBGgtjHR21GGsM9zEKHLWO+NwyDhBy0ItzRd33oZTjNPJ0/iihK/zYj
   CweOlToMAGKwE7jKi8OXTa7oQu01L9z7dRQSE5idnIvUoPKwb5GNNaQnd
   ACg5IjhN1lHAfhhqwtRcVQXr0J2AHaDgNkj4u+rkkjd/NtlfRHL+2XORS
   R8ud/hRSiOFMXbw4aGP3D4Gc8BGzJQxS/xLCXqObI6ZIBdrAi5nW8T704
   4wV+1rAFQuFU/Hvm1UcnmQLhdUnW8Z91n50jSoguzcVAD+HkzGQguals/
   A==;
X-CSE-ConnectionGUID: chKgSR8CTCe+PZluSQxmUg==
X-CSE-MsgGUID: q7nyk/S9S2+NMw6xaKPX2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73915340"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73915340"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:08:37 -0700
X-CSE-ConnectionGUID: kvt0hAz8Tt6GPxQK20VOtw==
X-CSE-MsgGUID: hzyltMxQTiqVlkITdn/MSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="187969536"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:08:37 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBcK8-00000001kjx-43rY;
	Wed, 22 Oct 2025 20:08:32 +0300
Date: Wed, 22 Oct 2025 20:08:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: tegra: Add ACPI support
Message-ID: <aPkPkHr0Hp_MabPx@smile.fi.intel.com>
References: <20251022063645.765599-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022063645.765599-1-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 22, 2025 at 12:06:45PM +0530, Kartik Rajput wrote:
> Add ACPI support for Tegra RTC, which is available on Tegra241 and
> Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
> The RTC clock is configured by UEFI before the kernel boots.

Thanks for an update, looks much better now!
A comment below, though.

...

> -	info->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(info->clk))
> -		return PTR_ERR(info->clk);
> +	if (dev_of_node(&pdev->dev)) {
> +		info->clk = devm_clk_get(&pdev->dev, NULL);
> +		if (IS_ERR(info->clk))
> +			return PTR_ERR(info->clk);
> +	}
>  
>  	ret = clk_prepare_enable(info->clk);

Since we still call CLK APIs unconditionally here, shouldn't be the whole
approach just to move to _optional() CLK API?

	info->clk = devm_clk_get_optional(&pdev->dev, NULL);

I haven't checked the code below, but maybe even one can incorporate _enabled
to this as well (in a separate change as it's not related to this patch
directly).

-- 
With Best Regards,
Andy Shevchenko



