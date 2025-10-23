Return-Path: <linux-rtc+bounces-5136-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA53C02D79
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 20:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5A774E5FA1
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 18:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4566E34A783;
	Thu, 23 Oct 2025 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVYHhWwj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B459236453;
	Thu, 23 Oct 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242703; cv=none; b=V3AFk1+cqqXdBW4ZNFS4wdLtiLMfPb8YAgc6V5gGtXJeXdChasWYhLIsJB6yRaZgUfnSoMEL7rPiFCvp/+G5GMuybRjW6Jzw06YhapmHer3BNHsf3FiBtzzSTar6pEU1O9HneKkVAoz0GXPuJsYoJsJUDWIzdKFBBqE8AfkZye8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242703; c=relaxed/simple;
	bh=EcT1kCG7x/XncRZmVXxe8mUlAQtaeTx9hXsGtv89k3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jq0xh4xPlSgrqndjNZtLr/wUJqzZz8/blg4wT+nVHlqmKMNww0OjSDe3+ErodQX0N2Zf5igCqcRIxFZlP4kOP9N6Fv0c77JdRyt6S9yMRiItkucauVDQJnKQiEfgJ7U7B0xm0Ed+koAOi8WNjSTC2vow/XKCPclyY5JGuhFUJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVYHhWwj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761242701; x=1792778701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EcT1kCG7x/XncRZmVXxe8mUlAQtaeTx9hXsGtv89k3Q=;
  b=YVYHhWwjdZ1x8gb6qJwVJUTeLkRLzF7UuP9RXPXqEZGU2kPqmv5ovb6E
   I4Ie+Nqgqm3SmmhmtNCuC3XBws0x6B/qWezk+xv5DVOTgFpyhOaMDuFYO
   iXhJYquEd1uH30rkjfe2HkZZVOu4mcuhxBdmT3BZqrvTidYVkFLHfYgbJ
   AlJbaEnP8Tex/sFyde3LWgddjhWsXko6BOfhHbWKUU7GLTtJuEf7QVZ7p
   13CImDTkswy209IFnlKEKPigqpr+rfZKA+QGuXs8bCkWdTQ1FcB3WAFvB
   Pa0IQMkaCqBYD+iTM6sB0bPBFldNdh0xTK9dl9QbNmh7XJoU7E+rUhWbQ
   w==;
X-CSE-ConnectionGUID: lhtsZUkkRCGP1bw3CIByyg==
X-CSE-MsgGUID: YuaxzkgRT+SfmMEKb3YAww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73712349"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="73712349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:05:01 -0700
X-CSE-ConnectionGUID: w8364WhJRIisp/nKk8eFfw==
X-CSE-MsgGUID: v3ve3t3/QGqI10TPFaVvEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="189479539"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:04:59 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBzgG-000000020jk-2Vdv;
	Thu, 23 Oct 2025 21:04:56 +0300
Date: Thu, 23 Oct 2025 21:04:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rtc: tegra: Drop deprecated SIMPLE_DEV_PM_OPS
Message-ID: <aPpuSJRRR5qOgrPR@smile.fi.intel.com>
References: <20251023093042.770798-1-kkartik@nvidia.com>
 <20251023093042.770798-3-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023093042.770798-3-kkartik@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 03:00:42PM +0530, Kartik Rajput wrote:
> Replace deprecated SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS macro
> and use pm_sleep_ptr() to initialize pm_ops. This also allows us to drop
> the checks for CONFIG_PM_SLEEP.

Probably Subject also should be "Replace deprecated...".

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



