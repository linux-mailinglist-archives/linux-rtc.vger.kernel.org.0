Return-Path: <linux-rtc+bounces-6955-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hnhmLWukT2pGlgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6955-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 15:38:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16409731A8C
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 15:38:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=jWmpMzzC;
	dkim=pass header.d=redhat.com header.s=google header.b=okDmZJZC;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6955-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6955-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80EBF306447C
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3358D283CB5;
	Thu,  9 Jul 2026 13:28:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F58287E
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jul 2026 13:28:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603722; cv=none; b=NAO3etg3XGfQIGXf/tH1o/E76fktzgsB04dN8Ohe8F851SJ2Qdik61md6vtD4+IuKJm4Akb6zLW5B24qrUdL3wDQmrT+FO4mtJRn0FhJg9/zzyvglV9PLddl6nS6D1XuaH6t8XyXt7ZyOuuDiglI/h0T14vizUdmodL3dsKIxyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603722; c=relaxed/simple;
	bh=X3LJtoIF2cz78g7fd2JzTBDARU25iOSmEdSyogFuUdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBWnAnyLuPZdO0677RtxOpwpA3y1N9llekTXFUKdnKuIS3/QIUG5fQUg7a/nlD0NoX8V//1AJx4VYlAL3CWnAtCITpkTKJYKalwIYoIg5ROadcx/X3+sMxjt5eyXSDib1ejrKe0ICxZ6KC40C1lJQt4EbuGuVTjIUQhvJNw26Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWmpMzzC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=okDmZJZC; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783603719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
	b=jWmpMzzC2hC2z64veBFuPOOykGak8gu1jYFpbVtbtk6KPP8IQTk+VXWS7zOkAlmLKRIlHk
	foNtHiFdHVpnu9vN71AzqGgjh3U6PAK2KcW+VyNlx2jGQDqz4oZyHtR6EX9aAgbi/3VhFr
	vCov2gLdS0WQ+wWoqz6EFYat8v9GRn4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-sdgB-wciMkehFBEClCEgRg-1; Thu, 09 Jul 2026 09:28:37 -0400
X-MC-Unique: sdgB-wciMkehFBEClCEgRg-1
X-Mimecast-MFC-AGG-ID: sdgB-wciMkehFBEClCEgRg_1783603716
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7ff58c89959so36876847b3.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2026 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783603716; x=1784208516; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
        b=okDmZJZCbV/HqschLJkt9nqeFZTJ3hCuDQ6lL7v6HyukNUKy4ll6eeT6IqpneiKoQq
         1U8x/sOFC6wGouSTIUlhYBuM0UoesvGpAM0e/XOJ4CUP4T6NGIG2R6lewaV+n+C32RHr
         ueJ5XPC5U4Pa88OIsTVcA6mnwV4kslh/1Mq8AmWljToAHEV05AI5bBOS8/uj2OpMdiBz
         lm8M+1KUGTOXJEmuFOnOSnfZkWH0W1pQ2Nk/8coSNycDaIM5cOe77WZJs+kXjKP+BFYA
         hBp8rZcYSFHF3l+pr1q/MjtnUjKZ+Rn0U3y+gGpLwAtYWpb/ZHBNVfskdBzy21tjCFOK
         peWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603716; x=1784208516;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
        b=kU4q5FTSrcbjmPHmXY8GEHURA8Y9EFxzh+WG3A6onz63h95Ef8RRcn8D5C12VCzWT6
         AkBagYh/M3bkD/8JqKchYQ0066wdXDPREwG5P51iH9b2h2yOCqKurIU4Pin02TCwbHeH
         BxrJDmuqSLyz/gwsTgdTOWelsDXdm4TOdL7Zwgyn17rW8rSTJNvdrbHlrrk8ciZ22aAO
         d91k2p6qQ2pOLhiixMXM4j74RGeHH5Z98BG7YdrAyAB8v0VV/Ibtg+/s6RRTat4XcyBc
         klnE0Fsd6IVVGYaaZfdqeERjVbmnXMQpH5OoXSlwxKvqG/SfbUdf4dLDnmPba+117ofG
         FVrg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6uYNPDNjuscSlw3FQxQyQs6Nq1VY5bDCyYgP61FANukruXVRy1O/g/UfO66rE5b6E4fuslHPxIkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoPbJjIqigv/ja3j/anrRJ0JPb3/rvySwihm6Jjpz9RVH50fK
	V+H8gwKxAgWfsTgtZ2gRk+7cB0w4ILtiZdKHz1Ln2fjQbcMDx0Fvceowfr9x0cxYUQgEi6HD6Yo
	jme0ujXPJBw55FKjSZY7pxg97uZ6+PNttVzWMkPhskwfyesG5uLnP0MRcc557sQ==
X-Gm-Gg: AfdE7cnXYG6VwB/ERkaXUTgebUKKbNPySbxgcMAcfV4KITnM7WQN16o1e+RchPZxdHX
	DMvKnid+Ve1LN2/dAvCS+wD5RFqW4miNLvlN1yjf3/Y0APpKnRE7l0LfYJhAB1AWVXdL6h/Lo5e
	sKqOi+QKcWQDN2NLo0sNpLyb8VHjGiIpPizXSHpYNO3XZ/l5HQQdQr2dQ/UCH3wp39gCI9QOnEu
	I1yLHe0TZ6YgLV/Sm4PEDNkcq1C16IQ+X18KfWdPE4scGc4YP1GUEHkp1+UOhSujowA93YzxaFj
	kbtTL8kdqKwYjyCJqNd50Vts8SVjA826820fTFjaCb+rXH6ImVjmdo/5gh9D1nse8YfuCguRORm
	fgty6tD/0nYLLB8FclxaPx2wYQs4jEdQSX45d8nm5fRNI/A==
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957921d50.14.1783603715998;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957877d50.14.1783603715498;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm4150627d50.16.2026.07.09.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:28:34 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:28:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <ak-h8oPcL69fCUg2@redhat.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-6955-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de
 ];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,arm.com,baylibre.com,vger.kernel.org,lists.infradead.org,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16409731A8C

Hi Hans,

On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
> On 9-Jul-26 12:10, Sudeep Holla wrote:
> > On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
> >> On 18-Jun-26 17:56, Bjorn Andersson wrote:
> >>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> >>> modules, but they are then not automatically loaded. Rework the SCMI
> >>> device table alias support to make modpost consume the information from
> >>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> >>> this information, if known. Also add a protocol-based alias to also
> >>> trigger driver loading when only the SCMI protocol id is known.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>
> >> So I just gave this a test spin and unfortunately it does not work.
> >>
> >> The problem with Fedora's kernel-config / setup is that the
> >> request_module() from patch 2/2 runs from the initramfs, but
> >> the scmi_cpufreq module is only available in the rootfs.
> >>
> >> It does work if I explictly add the scmi_cpufreq module to
> >> the initramfs, then it does get autoloaded.
> >>
> >> We really need some place to put a uevent sysfs attr which then
> >> gets replayed when udev is restarted from the rootfs and then
> >> re-reads all the uevent files as part of its coldplug
> >> enumeration.
> >>
> > 
> > I don't have much knowledge on uevent to provide any suggestions/help.
> > But isn't this a generic requirement ? I mean you could have modules
> > install on the rootfs and not all of them are packed in initramfs ?
> > Just wondering if that works for other modules, we can examine how
> > do they work and what are we missing ?
> 
> scmi is special because the actual devices under /sys/bus/scmi/devices
> only get created when the module with the driver is loaded because
> of some funtion/id mapping requiring info from the driver.
> 
> Patch 2/2 tries to work around this by loading all scmi drivers matching
> the scmi protocol which is known at bus enumeration time, but this only
> works if the actual scmi driver is in the initramfs because this done
> through directly calling modprobe() from the kernel which does not
> get "replayed" when switching to the real rootfs.

Should the SCMI drivers be added to the dracut module here?

https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73

A few years ago we had to add the interconnect drivers to the list for
Fedora.

Brian


