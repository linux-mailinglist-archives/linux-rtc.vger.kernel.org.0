Return-Path: <linux-rtc+bounces-6952-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3yanJh94T2ovhQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6952-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 12:29:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDE72F9A4
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 12:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F03vhvIw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6952-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6952-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF143302F3AA
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 10:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF6A40BCAB;
	Thu,  9 Jul 2026 10:10:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0EA40B38F;
	Thu,  9 Jul 2026 10:10:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591821; cv=none; b=pd5lRw1LnOwpW5ZFo9s8h3N6sSHhSTmqXvmfyZjkqhfrfMfTUxC77FGQjLcZyWE8cY9ZFsGIr7UnxAtfKoZTgVpOj68/J5K7EQgpgET3KpAWFUR3Ib36v+KuvJCvy95nK5IeCoaohFQY5Psl0AQG88bBAER9Vswf2s5tsXtUwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591821; c=relaxed/simple;
	bh=fRNeER7LnUmcwoquzvpNn39F7hoZUAISetj6EkZZm2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAglQaMDywneEb1thEshAVduxVhdTQAdza10AKSLHiCwHo//34ycBrSULpSST9TXkIaxsJI25G1amlNVvCSXhbQaTsbXrQ+iKaJjZl3wExj1ioZNlTwnV7EsOw8TczW1fWk7H5eHj+XIfWjv0wqxCY1W7gB2KXQgiQxjz1pheWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F03vhvIw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8C61F00A3D;
	Thu,  9 Jul 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783591819;
	bh=oWFW04FqDfkqF6FQ5XuyyPvQ7Y46Kanl78+AV4Ugsl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F03vhvIwmj4StkRYQPee7Mpo8rhhvPDYa1ZUqMf2+g/CIeGCVIfCN0xnG5MJNYpgT
	 G/xk+YiSmjsIpQ2a+ZCD1F7xW6UWIvVaIlA6EZhjtHM2GrgY2ZJp+KTKbZzmfeMY3V
	 YI9cy3UqYXyMdyhNZ1zM949+ZSyI5yjfsP0DsW4R6T1oCjhBIM50nriVks3E2TiNTH
	 S9m1h8vO+qxxJ7t4pzTYadBUln5t8vaGIXxmcrGaq5iBn0yQiXfbw6yHSMCKDUSEG8
	 sAdltXpvBqJuHdUtm+PegrAGj97SvlIeTEKN0AltXJqRF1FwfLCw0B+XrWz/skAojF
	 Ifn+6OI6uNVwQ==
Date: Thu, 9 Jul 2026 11:10:12 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
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
Message-ID: <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6952-lists,linux-rtc=lfdr.de];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,baylibre.com,vger.kernel.org,lists.infradead.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sudeepholla:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAEDE72F9A4

On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 18-Jun-26 17:56, Bjorn Andersson wrote:
> > SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> > modules, but they are then not automatically loaded. Rework the SCMI
> > device table alias support to make modpost consume the information from
> > MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> > this information, if known. Also add a protocol-based alias to also
> > trigger driver loading when only the SCMI protocol id is known.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> So I just gave this a test spin and unfortunately it does not work.
> 
> The problem with Fedora's kernel-config / setup is that the
> request_module() from patch 2/2 runs from the initramfs, but
> the scmi_cpufreq module is only available in the rootfs.
> 
> It does work if I explictly add the scmi_cpufreq module to
> the initramfs, then it does get autoloaded.
> 
> We really need some place to put a uevent sysfs attr which then
> gets replayed when udev is restarted from the rootfs and then
> re-reads all the uevent files as part of its coldplug
> enumeration.
> 

I don't have much knowledge on uevent to provide any suggestions/help.
But isn't this a generic requirement ? I mean you could have modules
install on the rootfs and not all of them are packed in initramfs ?
Just wondering if that works for other modules, we can examine how
do they work and what are we missing ?

-- 
Regards,
Sudeep

