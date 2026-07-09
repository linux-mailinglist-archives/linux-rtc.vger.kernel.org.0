Return-Path: <linux-rtc+bounces-6961-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EeMYNTHFT2qNoAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6961-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 17:58:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D673335D
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 17:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=evPqTocH;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6961-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6961-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25DEE300696B
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 15:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338F0426EA0;
	Thu,  9 Jul 2026 15:49:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5951D426EB7;
	Thu,  9 Jul 2026 15:49:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612190; cv=none; b=C1AJZgjU2rVvxAEi7LnGqaFg32gn6kaonzCCICuRSIFJkF2/sgSUIfIzZoWAWJFANF2JEGPNe5vBRJ2kubqHrkbO8pAax7RjZHxhPHhQpv6wT39scPHWNN34BZu2ZVbueMa4zcMeN/Qxs1/Ifa2R1YaAjicb7twObvN0poqGsbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612190; c=relaxed/simple;
	bh=ZsaKwAUaY+JsR6IrwdSMe3xghd912Wa8gpID9dHYC30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hl0QsuZ/9ZJ1k2z0DOMOqqx8nDVv+/gS2E1XWinXwdsvMY1I0rXtKQGY+tjVwlyg1hxmp7TXmJP4DFp1ayW/NExdich+++M64liRadHE57AyBu6FH0mugehs0uW94K83tWrZXgoCsNBUcfWhDoImK/btO/IotSbk7lB6pgYQ0YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=evPqTocH; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B76163591;
	Thu,  9 Jul 2026 08:49:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D82703FC81;
	Thu,  9 Jul 2026 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783612186; bh=ZsaKwAUaY+JsR6IrwdSMe3xghd912Wa8gpID9dHYC30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evPqTocHRC03pIflm2SZxRRhVRTiFHKTvKcjolKMB239pCjvuYrLCRhAd4L02W3jy
	 OFtPohxvaG0XD94c3XJ/Bfko/yektPa6o5yoouYGp8VpZFlOjWdSIMlvetlMiXttOV
	 mwgBG7Zg+hn0jDotXznT+qvyAZDMTiIfgXQkn4Eo=
Date: Thu, 9 Jul 2026 16:49:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
Message-ID: <ak_DCuTgF5uTI_Lb@pluto>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6961-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:johannes.goede@oss.qualcomm.com,m:bmasney@redhat.com,m:bjorn.andersson@oss.qualcomm.com,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,redhat.com,arm.com,kernel.org,baylibre.com,vger.kernel.org,lists.infradead.org,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:dkim,pluto:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 271D673335D

On Thu, Jul 09, 2026 at 03:37:33PM +0100, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
> > Hi,
> > 
> > On 9-Jul-26 16:21, Sudeep Holla wrote:
> [...]
> > > 
> > > I need to recall why we moved from static list of devices to dynamic.
> > > One reason I can think right now is the vendor protocols and their drivers
> > > But in general it was an attempt to help multiple drivers bind to different
> > > scmi_devices that have same protocol ID. E.g. the performance protocol
> > > can be used by cpufreq and devfreq/performance genpd drivers.
> > 
> > Note it is ok to have multiple drivers bind to the same modalias,
> > depending on the reason why there are multiple drivers either one
> > should detect that it is not compatible and exit probe() with -ENODEV
> > or there should be some other mechanism to make sure only one driver
> > loads.
> > 
> > E.g. duplicate USB device-ids happen (they shouldn't but they do) and
> > then the drivers typically figure out if they are talking to the device
> > which they were written for, or the other device with the same USB-ids
> > and then one of the 2 drivers exits with -ENODEV.
> > 
> 
> Understood. Sorry I tried to explain with examples assuming you may not
> be aware of the details, but now reading your response, you have better
> examples.
> 
> > >> I wonder if we can just move a small part of the drivers
> > >> (some mapping table) into the bus code and then just have this work as it
> > >> does on regular busses. I hope to be able to make some time to look into
> > >> this soonish.
> > >>
> > > 
> > > I started with that few years ago and we then moved to this dynamic
> > > device creation. But I agree if it is deviation from the norms(which I
> > > wasn't aware of at the time), we can remove it.
> > 
> > Looking at the issue this is causing for automatic module loading if we
> > can get back to the bus enumeration code always creating a device without
> > waiting for the driver kmod to load then that would be good IMHO.
> > 
> 
> Sure if it fixes the issue for you. Cristian can point out anything I
> might have missed to consider as he is the one who reworked it and made
> it dynamic device creation which at the time sounded nice option to
> solve the issue. We weren't aware that it could cause such issues 🙁.
> 

The reason for the awkward mechanism of dynamic device creation AFAICR
was an explicit request by Qualcomm (via its Linaro landing team at
that time) for the generic vendor module suppport that I was adding to
be fully self-contained: so that you can write your own protocol and
add the DT node and that's it, without the need to patch some centrally
maintained table in the core SCMI stack to add your new vendor protocol.

Not saying that it was necesarily a good idea to allow that, but that
was the origin of this....as far as I can remember....together with the
fact that the internal interfaces were reworked to be absolutely the
same for standard protocols and vendor protocols...

I thought that the current situation was that auto-loading was working
for vendor protocols (this autoload issue appeared at first for vendors
protocols one year ago) then I had made this hacky attempt to make it
work for standard protocols by forcibly emitting a uevent for all known
standard protos:

https://lore.kernel.org/arm-scmi/20250203100154.140877-2-cristian.marussi@arm.com/


...but that was clearly not the proper way..and all the rework was
dropped...

Thanks,
Cristian

