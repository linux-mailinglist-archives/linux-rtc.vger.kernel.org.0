Return-Path: <linux-rtc+bounces-6962-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQTWDH3GT2rNoAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6962-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 18:04:13 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC753733405
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 18:04:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XaG2qQ4l;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6962-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6962-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE36130A7AEA
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 15:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DBD42CB05;
	Thu,  9 Jul 2026 15:55:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C420347524;
	Thu,  9 Jul 2026 15:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612502; cv=none; b=Mq9wOPH4FzxPhxS7JoTmnSTDcPx+wFWrgmsKEk9jZeJNVv2T0t5K7srvE4mzZur77buUQ1IPPdE9PCq2GrYhn1DtZrMp2IgjyuZ1Da68QaqDbxSD81auGCaoXOeN72PwSaXI9Vv1G6gG9S4NWdTMh543CJt1nqYAsWq/UsfBM2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612502; c=relaxed/simple;
	bh=9mNqEvfqjhsVEIi9u+oh6DpD3WvbBmuHHEOFe8zdlaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YY1qdY0jiR72Ruv1IsiUIk3dhFSO7zEJeLc9LHwFcBsMdgh2dZs1OjL8VNq46Dwz7LPQ3v4bwuVnK8YDIeaLL8RPRqutnihjCVogqWctDW0D+CRiThbB4XXBb9UwJI8NURKWgU0ojIFr63UQ8gLsVXQw6F4sUY0lfxjOKK9Omyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaG2qQ4l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729F11F000E9;
	Thu,  9 Jul 2026 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783612501;
	bh=6MsUtMMF0iX7CLexIqOJRQHr1SBSErDvCsEOI8eH/gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XaG2qQ4lKyQHhnKBQceTBgsARkSR1fZhkvfbcutKN6ZPCGSyvfrZckrXqgjhjHz0t
	 nMenzU4cqVHyzTR+yvbLA57qSrBwR1/mdS9wJKsnVwTdwxX6yAMZjSIWVehdeBndRL
	 93M+hB0LGjPiRjBhZWm/Fp+AFZS1hTDDF4o0tOJVO2nU2xWKwpD7Xq7KC+Z1XB2aW6
	 awbRb+E53okTkYmdHUezT47eDMXNRcvbF0Lk1oKAT2FP9jgP4JaJa1doC9QwIZ4bTY
	 dgdF0k7f5Uw9tBFDXDW8R+eAhJuSZ5KvmYM/Jp39GFmRgC54iWBGDC1ywpVcySZ/BC
	 tN9m5rLEF1n+Q==
Date: Thu, 9 Jul 2026 16:54:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260709-rainbow-expert-bloodhound-b887e6@sudeepholla>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
 <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:bmasney@redhat.com,m:bjorn.andersson@oss.qualcomm.com,m:cristian.marussi@arm.com,m:sudeep.holla@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6962-lists,linux-rtc=lfdr.de];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,oss.qualcomm.com,arm.com,kernel.org,baylibre.com,vger.kernel.org,lists.infradead.org,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sudeepholla:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC753733405

On Thu, Jul 09, 2026 at 04:49:18PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9-Jul-26 16:37, Sudeep Holla wrote:
> > On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 9-Jul-26 16:21, Sudeep Holla wrote:
> > [...]
> >>>
> >>> I need to recall why we moved from static list of devices to dynamic.
> >>> One reason I can think right now is the vendor protocols and their drivers
> >>> But in general it was an attempt to help multiple drivers bind to different
> >>> scmi_devices that have same protocol ID. E.g. the performance protocol
> >>> can be used by cpufreq and devfreq/performance genpd drivers.
> >>
> >> Note it is ok to have multiple drivers bind to the same modalias,
> >> depending on the reason why there are multiple drivers either one
> >> should detect that it is not compatible and exit probe() with -ENODEV
> >> or there should be some other mechanism to make sure only one driver
> >> loads.
> >>
> >> E.g. duplicate USB device-ids happen (they shouldn't but they do) and
> >> then the drivers typically figure out if they are talking to the device
> >> which they were written for, or the other device with the same USB-ids
> >> and then one of the 2 drivers exits with -ENODEV.
> >>
> > 
> > Understood. Sorry I tried to explain with examples assuming you may not
> > be aware of the details, but now reading your response, you have better
> > examples.
> > 
> >>>> I wonder if we can just move a small part of the drivers
> >>>> (some mapping table) into the bus code and then just have this work as it
> >>>> does on regular busses. I hope to be able to make some time to look into
> >>>> this soonish.
> >>>>
> >>>
> >>> I started with that few years ago and we then moved to this dynamic
> >>> device creation. But I agree if it is deviation from the norms(which I
> >>> wasn't aware of at the time), we can remove it.
> >>
> >> Looking at the issue this is causing for automatic module loading if we
> >> can get back to the bus enumeration code always creating a device without
> >> waiting for the driver kmod to load then that would be good IMHO.
> >>
> > 
> > Sure if it fixes the issue for you. Cristian can point out anything I
> > might have missed to consider as he is the one who reworked it and made
> > it dynamic device creation which at the time sounded nice option to
> > solve the issue. We weren't aware that it could cause such issues 🙁.
> 
> Note that before patch 1/2 of this series we did not have working
> module-autoloading for SCMI modules at all. With that said yes it would
> be nice to get this working.
> 
> Can you provide a patch for this to try ?
> 

Not sure what exactly are you asking, but I don't have anything w.r.t
the discussion handy to share. The codebase has moved a lot to revert
just the dynamic creation addition patch unfortunately.

-- 
Regards,
Sudeep

