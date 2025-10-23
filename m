Return-Path: <linux-rtc+bounces-5135-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B22FC02D6D
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 20:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C963A2354
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 18:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA6F34B1A6;
	Thu, 23 Oct 2025 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQleghFZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D32D73B5;
	Thu, 23 Oct 2025 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242648; cv=none; b=ME6iczredQmc3wb7301Dad9UQbaIQbqLuCQeErtkFt3NJZTp0YE3Ux/2zQ+d0JYi2cTDMsWHwVeKeVD1WfqDj+7z73reLUUeqvtjKlKkMlILBVATcTkow4dgCvp4n+z3ZzdcQZcjj2zG5EGPzZnMReWBMgSKup1iheL4NTFYUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242648; c=relaxed/simple;
	bh=moFoF9gqNdCQFpUxyhy2PJhjL2j71/N1hATC3N0gGt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUHHxOZhPi7VUZHn9FGkfQ9u9VnsBYdMvqlhv/sqBjq4+HzUVGxdOBy1MXnazzfXckHqY//22iEj5RsJXIQoFmwf+kglQBycmXXWY8/6rURQx/nfanIjQ0nJmbtXb5jqJ2reQHZ4jM5YkezKWWTJragSKut+4M05gwQi9wqoLco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQleghFZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761242647; x=1792778647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=moFoF9gqNdCQFpUxyhy2PJhjL2j71/N1hATC3N0gGt0=;
  b=mQleghFZ4hPsiM8Fn4Cu6HRJy6hP4EBL/Tm5zIbGbZgoTPueoPzQ4X4j
   9ul+/BA9zJ4SqAE1LKZPzHDLmEQgKKOPhINzYb2/UrMiSfwCq9TQQW8e+
   lyaNLE+z0x7z7GMIpGSJHUplBa8Bxk6NylliIhccHv9oDY1beDZGa94o+
   1LU+0miHWb9kCircMQqFMt0u9JU3jhb+04+ywZFZJswegxNBJvplD2nQ0
   nqWt5lJWVdsqfMyb0cX63zbfj5VZyovMjVZBaYPxjUbjuzqH76i6I2E8L
   KKqGd/FK009k8FTKRlgs1BtJO9XnWKE1WLJ9HRW3TRlnZKlRTBKGup0I6
   g==;
X-CSE-ConnectionGUID: zn9wqzC5TuazgI+k8q5oZA==
X-CSE-MsgGUID: 9+FDensVQGO91Lj8EV0+Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63516987"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63516987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:04:05 -0700
X-CSE-ConnectionGUID: DXYsynzcST6UBuV8rwnSuQ==
X-CSE-MsgGUID: UF0PhuyCQZ6YMjDDG4Vfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="184701939"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:04:03 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBzfN-000000020jU-01c7;
	Thu, 23 Oct 2025 21:04:01 +0300
Date: Thu, 23 Oct 2025 21:04:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] rtc: tegra: Add ACPI support
Message-ID: <aPpuEOz88D01HjMk@smile.fi.intel.com>
References: <20251023093042.770798-1-kkartik@nvidia.com>
 <20251023093042.770798-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023093042.770798-2-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 03:00:41PM +0530, Kartik Rajput wrote:
> Add ACPI support for Tegra RTC, which is available on Tegra241 and
> Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
> When ACPI boot is used, the RTC clock is configured by UEFI before
> the kernel boots. On device-tree boot, the probe must fail if clocks are
> not provided in the device-tree.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



