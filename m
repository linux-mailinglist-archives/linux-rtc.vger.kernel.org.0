Return-Path: <linux-rtc+bounces-5137-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 124DBC02D81
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 20:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88123A534A
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 18:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC3A34B1A9;
	Thu, 23 Oct 2025 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYHLvRL3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820CD236453;
	Thu, 23 Oct 2025 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242762; cv=none; b=aHpWMI+54nqAX03u9A3DKOv5OWjxeIherDxjYVxNukgZHwlcCqDgisRhwGNDTIUx2jpgTc88UcSP+XxLEBz8hher2CfFkgCx3XTouKUMQgoyuf+WC1wTsqcuLBsc+24V3sY6CeoSBBgj0mGqiqszUZSb2T27ND3JIaRdNBPwG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242762; c=relaxed/simple;
	bh=ZC+FbIrrH5H4EU21SpNhVgK4j6OO+DoWiJHHCvyDPp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtjhmpJDWnx8ZeG3bv/6VpSWGbdms8KaHGPX74SGaIYjDK8nNxVp5VVAN03bjIikbIqYPrMRAt4XxchLdBwrpIFI7OLkeARQUFtcaC0YHyMnd3LvL9tJ9bAAFPVHcmFpjy+KWB6pFUmj5H76blL4BA7X1PkqNUjiEkf02rkNMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYHLvRL3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761242761; x=1792778761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZC+FbIrrH5H4EU21SpNhVgK4j6OO+DoWiJHHCvyDPp8=;
  b=RYHLvRL3ftpURfXA7DpSlCfVMCJf3lO7C/pkjJBu2C26farKfA8210Fr
   UDRJOxinlNPmhlU9Wj7a/4KhDj5H/UMsDlF5wM/37piNE6LDqcgs7CuSg
   Egz0zXAhjmy4wc+pcYYEVyY4wk3twqC86IhgP5Op8gn1K6DeTeY/3zJtp
   YVi6gM9fPTQDc5CrzjA60P1BYqqs99Wkl08K43x6LaT2iuH6dAXYcDMxW
   zdwnYn+oRaf7M3IEndFTB2lza8JRzszyxWUhvjt4uHiZz/AEhhhTMnta6
   4xibXycwEOjtxkk0AS63G8nl12v8nMr46OlpDK84j3q9jM+EUuxh7knls
   Q==;
X-CSE-ConnectionGUID: 3T2CoiBBTUCIs22d/sqYpA==
X-CSE-MsgGUID: 1z5cnOdrT6eN6PDifR50Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62453767"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="62453767"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:06:00 -0700
X-CSE-ConnectionGUID: f7iP42xpSpKQCHvwZDFu9g==
X-CSE-MsgGUID: ayrCixg1SgejRxxZuUfRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183829559"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:05:58 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBzhD-000000020k3-1bWs;
	Thu, 23 Oct 2025 21:05:55 +0300
Date: Thu, 23 Oct 2025 21:05:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rtc: tegra: Use devm_clk_get_enabled() in probe
Message-ID: <aPpug9kcQwQlhivK@smile.fi.intel.com>
References: <20251023093042.770798-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023093042.770798-1-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 03:00:40PM +0530, Kartik Rajput wrote:
> Simplify clock management by replacing devm_clk_get() and manual clock
> enable/disable with devm_clk_get_enabled(). This also simplifies the
> error handling logic.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
with the caveat that you need to remove ->remove() altogether as well.

-- 
With Best Regards,
Andy Shevchenko



