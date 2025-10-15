Return-Path: <linux-rtc+bounces-5094-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A11EBED592
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Oct 2025 19:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ABA1634D54A
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Oct 2025 17:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4460C25E451;
	Sat, 18 Oct 2025 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTjqkM7w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B925F998;
	Sat, 18 Oct 2025 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808871; cv=none; b=iWVQfe48CLSy7UxO3tpQEd7k1Fve0C6SgIXesQL+ieY6iq/PZ0QUpy1TKqqvsFO1qkdlkWTWTSKSq/ZkCtJHkWCAlO7xxO4Z4NCkrg0Y1JXcFLYiBPFdLtgIeIW3Y/3ZFu76EvtjPbDy+f3jFNzKvVu7ahFLPXSaGsRKO/NK5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808871; c=relaxed/simple;
	bh=6AWXSaPbH218iF35/hv8CWjRsfc/4VaeAzGRcUvVqHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKd4Xp9HxACeF3XGtr8IYB74rlgANKYiQ4m3aeF3jhXBIhgz4PJle5rzC9dfGst51aH48MPVUGPkwfENIuELL0aFZDKa1t/raKCunZvvX8bLdPNWyiOZ8FQOjx4bvXF5bVe2nwDuqNgmsQnKyahpmrP4G/QVjQyzXxv3jKLmF+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTjqkM7w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760808870; x=1792344870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6AWXSaPbH218iF35/hv8CWjRsfc/4VaeAzGRcUvVqHE=;
  b=VTjqkM7wRpJttk6yfmbMRvKIIy9Jk5d67neGK8aa9rvhPGv2zIHP7Srj
   f4GGCX5Nr47dATmgXruW2kvzkPg+za6VsgSxZj8P1cEHhILxPvv7rZj6B
   G5jPvzCKvGObE8DJdV8Q71X2W6TN+n92DC4X3vNA3FUa+hrHaFbfHZGGX
   sF5qUD8vTg+mkCKss/FPQHgj/f7B6JBzeggd2MPPIjPy20mWkrRbjLw8F
   tpkEmz9SItcabRVRMq/IMcUZqUSJMAZODvwBP/54EGV44JFX5xgEZV5rH
   EgGo8FuCGmW5KQtdyvVY2FZLOvOmTqI48ONl/7vG0wfu2sI5WSacXqd4+
   A==;
X-CSE-ConnectionGUID: /cBNzXB0RreVx9hSyFA75w==
X-CSE-MsgGUID: g6db/y60TGK/CBYZHIidSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66864036"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="66864036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:34:29 -0700
X-CSE-ConnectionGUID: MS8PSnlUTOWdesxJd/DnwA==
X-CSE-MsgGUID: 6J6v8s9TTNCbiwxHtz01eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182995848"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:34:27 -0700
Received: from andy by ashevche-desk with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1v8wUz-00000000Cqh-28bB;
	Wed, 15 Oct 2025 11:04:41 +0300
Date: Wed, 15 Oct 2025 11:04:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: tegra: Add ACPI support
Message-ID: <aO9Vmfm6jPplEQca@smile.fi.intel.com>
References: <20250919111232.605405-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919111232.605405-1-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 19, 2025 at 04:42:32PM +0530, Kartik Rajput wrote:
> Add ACPI support for Tegra RTC, which is available on Tegra241 and
> Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
> The RTC clock is configured by UEFI before the kernel boots.

...

> +#include <linux/acpi.h>

No use.

...

> +static const struct acpi_device_id tegra_rtc_acpi_match[] = {
> +	{ "NVDA0280", 0 },

Drop redundant ', 0' part.

> +	{ }
> +};

...

> +	if (is_of_node(dev_fwnode(&pdev->dev))) {

Simple dev_of_node() will work here

> +		info->clk = devm_clk_get(&pdev->dev, NULL);
> +		if (IS_ERR(info->clk))
> +			return PTR_ERR(info->clk);
>  
> +		ret = clk_prepare_enable(info->clk);
> +		if (ret < 0)
> +			return ret;
> +	}

...

>  disable_clk:
> -	clk_disable_unprepare(info->clk);
> +	if (is_of_node(dev_fwnode(&pdev->dev)))
> +		clk_disable_unprepare(info->clk);

Redundant change. CLK APIs are NULL aware.

...

> -	clk_disable_unprepare(info->clk);
> +	if (is_of_node(dev_fwnode(&pdev->dev)))
> +		clk_disable_unprepare(info->clk);

Ditto.

-- 
With Best Regards,
Andy Shevchenko



