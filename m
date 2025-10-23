Return-Path: <linux-rtc+bounces-5129-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE8BFFA2C
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 09:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 645C5189187C
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 07:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E7A2C11FB;
	Thu, 23 Oct 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC6vHDl5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFC2C0F81;
	Thu, 23 Oct 2025 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204964; cv=none; b=BoWLFegsBc3AatQdfeY6y5rB5fa3aUSn2ISM6920Yd1GMqmn6aUhFbMKagK0puh1LJlpBKPlkBWODRg43bu+vH3OE4wziXeytMPvFkSZr4WeH5mVSNvCyV/Lq7S7Qr8WHgJ4km5PaSP24raIwIdLADHrmJ4oE7V+yGHvqCNGDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204964; c=relaxed/simple;
	bh=2pljTtaPlENS87LA/GONT1o4bDh6GkU5GHWm7MU7xBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ri7jLrr+1/d+iGFLKqQJy3LtyrJ9CNH8IMSk3sRnNtj/1TMWfdGN7+1/ReCk9MOdAx/icCr5tHj13mj/6uEUD9ghtwSAj14oSikUTYXf8kK/sNJDVOdA81YaUrShZP+N64wui5kVygogesXF1Ibsm5Ve+c4eycUNJ/XdkK52iYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC6vHDl5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761204962; x=1792740962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2pljTtaPlENS87LA/GONT1o4bDh6GkU5GHWm7MU7xBU=;
  b=KC6vHDl57+6Jcwy2P9R3D5jxDEYfIPibHimVBzZfv/Gg/c0R8s4NbWup
   04J+Uh4ULMdAX5eiTiTniQ/G3wU+n37PgUVwEf1JaOh2Vb8/YWgRBD+1/
   Kg/bvHkJKol4RcOyECCqL+mRJaJ6cbbzMD/QeVXwZWUnXhO+hZhnvx1qV
   RpemqJEkVVMQ9H7Jl4Tn5X5dQXV+kQfhwNwUXx0cdQT5i02PnEuOwKjIQ
   i9IveBFA9bbMtm8Fy+1+0RGJAla1jZr8QrybfvlV8xiGRYFyJZYci8Iiw
   1griukSTgE6TiLBGxGF2Xs09vWvFDjDYNjxV5YMFqPDzIY/olFoVhLxUx
   A==;
X-CSE-ConnectionGUID: A/3DQxNZT6e5HSEq2AZkPw==
X-CSE-MsgGUID: FyorJxB8TuaJF7PalffsHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74484625"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74484625"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:36:02 -0700
X-CSE-ConnectionGUID: kWBtQPJMQS2kuQJkY0IlNw==
X-CSE-MsgGUID: 5pVIH9xvSs+Wqf+6MXzYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183981247"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:36:00 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBprZ-00000001sFx-2efz;
	Thu, 23 Oct 2025 10:35:57 +0300
Date: Thu, 23 Oct 2025 10:35:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: tegra: Add ACPI support
Message-ID: <aPna3Q9L4Rc9Ufxt@smile.fi.intel.com>
References: <20251022063645.765599-1-kkartik@nvidia.com>
 <aPkPkHr0Hp_MabPx@smile.fi.intel.com>
 <f4defdc9-2cc0-45a0-a391-cb8678eb1b23@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4defdc9-2cc0-45a0-a391-cb8678eb1b23@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 12:14:13PM +0530, Kartik Rajput wrote:
> On 22/10/25 22:38, Andy Shevchenko wrote:
> > On Wed, Oct 22, 2025 at 12:06:45PM +0530, Kartik Rajput wrote:

...

> > > -     info->clk = devm_clk_get(&pdev->dev, NULL);
> > > -     if (IS_ERR(info->clk))
> > > -             return PTR_ERR(info->clk);
> > > +     if (dev_of_node(&pdev->dev)) {
> > > +             info->clk = devm_clk_get(&pdev->dev, NULL);
> > > +             if (IS_ERR(info->clk))
> > > +                     return PTR_ERR(info->clk);
> > > +     }
> > > 
> > >        ret = clk_prepare_enable(info->clk);
> > 
> > Since we still call CLK APIs unconditionally here, shouldn't be the whole
> > approach just to move to _optional() CLK API?
> > 
> >          info->clk = devm_clk_get_optional(&pdev->dev, NULL);
> > 
> > I haven't checked the code below, but maybe even one can incorporate _enabled
> > to this as well (in a separate change as it's not related to this patch
> > directly).
> 
> The reason I did not use the _optional API is because the clocks are required
> for the device-tree. Therefore, it must fail if clocks are not provided on
> device-tree boot.

I see, please mention this in the commit message. And perhaps add a patch to
convert to devm_clk_get_enabled().

On top of that you also can convert driver to use pm_sleep_ptr() and drop ugly
ifdeffery. But this is really out of scope, and up to you to decide.

-- 
With Best Regards,
Andy Shevchenko



