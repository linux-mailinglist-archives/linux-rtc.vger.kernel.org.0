Return-Path: <linux-rtc+bounces-5673-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24068CFEA2B
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 16:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 387163045747
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 15:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DF535CB60;
	Wed,  7 Jan 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="H9QVyw70";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zz7jvGms"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0435C1B2;
	Wed,  7 Jan 2026 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797834; cv=none; b=ZngN7WBvwzlQXCVD01siozDzPts83VBttqY+4rIxegP5ovhoCvT8yA/6PtGqBDJTtk1WhITs7VEkIFLK3ikMbc4stXLGBL4ZufS4dzbQFnWvym8ogx71p0RpyyEI77t+Zhh9SGWqUmhgiAPRBK68dg7NVgB+QmflCR+1ZG0bfj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797834; c=relaxed/simple;
	bh=Xb4gIqjE1CeH7E7RF8QP9eK56jjy/3EJ/nYeYdZswmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI6seb9XsnPoSfCmYi8M5bkvWGMA8AYE43oZNXxuJkmBdj8HeatFlOdylRIB8Efgo9Lbnei4Ccs8pg39t05sj2EA2u5aO5eyVBT+Atq/ECe8Tus+gkHv2ze8kXkfXzoToHwZQkhTf4x/12WokE+m/lsUoeW7XGZD24OopYjag/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=H9QVyw70; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zz7jvGms; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 161F97A0052;
	Wed,  7 Jan 2026 09:57:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 07 Jan 2026 09:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1767797829; x=1767884229; bh=WB2OwvfMoL
	Jw1R0SIQJrGtw8yKhbBALMJyWUYN89M2o=; b=H9QVyw70FfrcaAp2g/BeyIrP41
	LNB/wHhKuyC4pcPQvRSJcgR0P0I+KvLjAq5iPLcv+eAEVRFVZfm2IbYXit01f/hR
	CIBcFflfGx1TtpK0kZez+2AEqdKbA3mUiQ4yjaP8Mm+4+lxhXL9dBrp5HXtkvmgh
	onlDthwB93vl1UKdTtUGAIJGT9/mMzMYMkrtU+ZoLvOonLUYWtTkr1tvi5eDm0hW
	RwMeDVYbGIoZHqHnmO4OhNf2vEpMEAJLhb+O0fmeznb3D2A2Qh7ybvenFh4+bLtd
	3ajp+Oo6oJTjmvWYLQlw1Zaf5ZW3iA7av+D596oKfn9AmYq6zPjtwnV6MAVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767797829; x=1767884229; bh=WB2OwvfMoLJw1R0SIQJrGtw8yKhbBALMJyW
	UYN89M2o=; b=zz7jvGms08o3eT4xq4xeqJBxCs1x2KTAEWho1CdDupxoccrzFBA
	8ST06PWhWY9/lKRhimLzk1U9xxg4XORKRNQOl30QUXortJQIdkGVrvrdngNYk7Pn
	zfJ50MUai8Nw1YLw2WLrrco7eRlrfVNZNLJaFR3kiaA9tKVz6J6/HTYDAnUUW9H9
	jI4CaQc5pWixYGfYMClbzpZ5VEbM41L//YfxlQoBLXVx9g1msZ4O8cuF7+uxi9Py
	SsIK/QwmuxkiPz18RWPsv+bTo3M35iiFEnG6zQKvHDRSx5uMfgOlPHxFDH2re9Yd
	ei7ZktCo71oJ0xRBU6TYi6VbX6dI5CqT31w==
X-ME-Sender: <xms:RXReaU7cVScyk3KzD_LdZFP-WxdOiFckiX16GuzSQOrWJyjXVAp9fg>
    <xme:RXReadY4XFeEL3gypCm4BfYCkg406rdUzZSr5Gxl_7XMMZQsYKujLfR2odG0ZAV-6
    e3CB8Wr111EVkdwMhz4rTcChEGNH5CurmooOGVJEQH4tOwbOQ>
X-ME-Received: <xmr:RXReaZiNQJB6yJhBvHMjFcZ2Yc4X1tcziuGlsWpDNACZmGtJVlIVFvGNeIC1WK9UrM_n94XutrnVJhuugh0raZLEW-zjCScgdHpKPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeffeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhunhhkvgeskhihlhhinhhoshdrtghnpdhrtghpthhtoheprghlvgigrghnughrvg
    drsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehojhgvuggrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegs
    jhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhssh
    hinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:RXReaXPjgxJOtFZgzKenUX8jTd9YtU7ZFohofVaHCXwNCSgGSUIQew>
    <xmx:RXReaTMLM8YuX1ZfnG-JQfuoBVSnyxm74h2QAg8lqauQUBQttUHlGQ>
    <xmx:RXReafLp8gkT8TW_OqyNR5-MPM0jZtoHNP2MlHTYlz_jECs-o8eLlg>
    <xmx:RXReaSvyb-aNZUG9GtE71yRAOHvlpVdHMKryH-lRca_TIHR8BHSRLw>
    <xmx:RXReaURwhUJt7ap3m5QMxdNdQOf6to_pkAR-TaFyKlcaT3HItm4tNncl>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 09:57:08 -0500 (EST)
Date: Wed, 7 Jan 2026 15:57:05 +0100
From: Greg KH <greg@kroah.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
Subject: Re: [RFC PATCH v2 3/5] rust: add device wakeup capability support
Message-ID: <2026010701-rendering-upheaval-e056@gregkh>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-4-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107143738.3021892-4-sunke@kylinos.cn>

On Wed, Jan 07, 2026 at 10:37:35PM +0800, Ke Sun wrote:
> Add Rust bindings and wrappers for device wakeup functionality,
> including devm_device_init_wakeup() and dev_pm_set_wake_irq().
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/bindings/bindings_helper.h |  2 ++
>  rust/helpers/device.c           |  7 +++++++
>  rust/kernel/device.rs           | 17 ++++++++++++++++-
>  rust/kernel/irq/request.rs      |  7 +++++++
>  4 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index fa697287cf71b..d6c2b06ac4107 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -88,6 +88,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/xarray.h>
>  #include <trace/events/rust_sample.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>

Aren't these sorted?

>  /*
>   * The driver-core Rust code needs to know about some C driver-core private
> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
> index 9a4316bafedfb..cae26edd83696 100644
> --- a/rust/helpers/device.c
> +++ b/rust/helpers/device.c
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>

Why are both of these needed for just one function call?

thanks,

greg k-h

