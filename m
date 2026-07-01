Return-Path: <linux-rtc+bounces-6806-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xxn/CMDXRGq41woAu9opvQ
	(envelope-from <linux-rtc+bounces-6806-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 11:02:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6966EB6B1
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 11:02:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=LsJ3D6wO;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6806-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6806-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4F9B300A75E
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 08:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AF93EFFA8;
	Wed,  1 Jul 2026 08:57:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1963EF0A4;
	Wed,  1 Jul 2026 08:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896267; cv=none; b=tcYoChCyOMRSUUiXO7+SJiXMp7GgBMz4dftcTuNuOW3CKDDhGG1KNwSKZuh8mhYmH5LrxwyB00JdGDB+1yXZpTPwv6YcPMk36MJipzscEi+Ivm7zKVdJRRY/jQuqtModFGdUNKfF8djV9gZlpoH6H0iTbKpOMzEsC2ARVFfbQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896267; c=relaxed/simple;
	bh=8qjndy/hvk2z0aSIhvdIBLWQW/uMIsI8iw/CAEmcr9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMcJ0aw3hYLkecDZzTJT103meXJffscmXJ3whnZK32oh8EyJBwkDqwPUHD9DW+3eREjQLTfJYhPg4QMpkFqnc4aGihrb/idmW/xIRJ8ZFHMlIxFwoXWMRNKo7V/920vFOd8skA4R5SXOGYaZce09rP1ESq3DAyX+8I5tn0gY1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LsJ3D6wO; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 49A4C1A0DA9;
	Wed,  1 Jul 2026 08:57:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1513660288;
	Wed,  1 Jul 2026 08:57:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06A99104C9A11;
	Wed,  1 Jul 2026 10:57:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782896262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aBY1si8jAw7FZPH5hek8K7FZ8UegYnYcy82l6JhzA7E=;
	b=LsJ3D6wOgyzYDBRRbG/uVCnLagrWmqyMxcb34Gyo16mnoVJedNronHVt3OLm9gEvBBdQDY
	AOV1tO2B3yobq8DkmmnuasnB/Czss4ZYnZmfl94hexA3UA3AS+QrxzJQ8g4HP6yGUrv021
	9xaYWfwIVBig7dHKbuCkDkPWqExtKNheY1HRekf+VsoYZavCURViVWMjIbsFz96zOAutFK
	N91Mg1qG/jRPMFAPEpXeyGMfsuNk0KUwV/z54yAYnqEdQIHcWRLm+bEYGPS5G/i8lD3OLH
	U8kJsj7CHPJ/62DNrLvhZd47jnymBk4p4syQljIcoKcqFrxyM573LssROF2W/A==
Date: Wed, 1 Jul 2026 10:57:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Balakrishnan.S@microchip.com
Cc: amergnat@baylibre.com, baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com, orsonzhai@gmail.com,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
Message-ID: <202607010857395be38657@mail.local>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
 <20260528-cleanup-dev-err-probe-rtc-v1-4-29dc9cb6c3f0@microchip.com>
 <178283943069.3929176.6475131827523489401.b4-review@b4>
 <7867be72-2f25-4ea7-9b08-9ee8a8037ca1@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7867be72-2f25-4ea7-9b08-9ee8a8037ca1@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,linux.alibaba.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6806-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Balakrishnan.S@microchip.com,m:amergnat@baylibre.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[mail.local:query timed out];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,microchip.com:email,mail.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF6966EB6B1

Hello,

On 01/07/2026 07:26:29+0000, Balakrishnan.S@microchip.com wrote:
> Hi Alexandre,
> 
> Thanks for the review/feedback.
> 
> On 30/06/26 10:40 pm, Alexandre Mergnat wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Thu, 28 May 2026 09:16:47 +0530, Balakrishnan Sambath <balakrishnan.s@microchip.com> wrote:
> >> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> >> index a4678d7c6cf6..342fd2b568a3 100644
> >> --- a/drivers/rtc/rtc-s35390a.c
> >> +++ b/drivers/rtc/rtc-s35390a.c
> >> @@ -479,10 +479,8 @@ static int s35390a_probe(struct i2c_client *client)
> >>                return PTR_ERR(rtc);
> >>
> >>        err_read = s35390a_read_status(s35390a, &status1);
> >> -     if (err_read < 0) {
> >> -             dev_err(dev, "error resetting chip\n");
> >> -             return err_read;
> >> -     }
> >> +     if (err_read < 0)
> >> +             return dev_err_probe(dev, err_read, "error resetting chip\n");
> > 
> > The devm_i2c_new_dummy_device() loop above this hunk still uses
> > dev_err()+return PTR_ERR("Address %02x unavailable"). dev_err_probe() takes
> > format args, so it converts cleanly:
> > 
> >      return dev_err_probe(dev, PTR_ERR(s35390a->client[i]),
> >                           "Address %02x unavailable\n", client->addr + i);
> > 
> > Worth converting for consistency with the rest of the probe.
> Sure, I'll fix this too in next revision.
> > 
> >> @@ -493,16 +491,12 @@ static int s35390a_probe(struct i2c_client *client)
> >>                /* disable alarm (and maybe test mode) */
> >>                buf = 0;
> >>                err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &buf, 1);
> >> -             if (err < 0) {
> >> -                     dev_err(dev, "error disabling alarm");
> >> -                     return err;
> >> -             }
> >> +             if (err < 0)
> >> +                     return dev_err_probe(dev, err, "error disabling alarm");
> > 
> > This message is missing its trailing newline (pre-existing). dev_err_probe()
> > formats as "error %pe: %pV" and does not append "\n" itself, so the line
> > runs into the next log message. Since you are touching this line, adding
> > "\n" is a cheap fix even if the issue was here before your patch.
> > I recommand to fix it ;)
> Okay noted. Will fix it too.

Honestly, my plan was to not apply those patches because once I do
that, I'll get hundreds of those. There is no benefit to the change and
I'll cite the dev_err_probe doc:

 * This helper implements common pattern present in probe functions for error
 * checking: print debug or error message depending if the error value is
 * -EPROBE_DEFER and propagate error upwards.
 * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
 * checked later by reading devices_deferred debugfs attribute.
 * It replaces the following code sequence::
 *
 * 	if (err != -EPROBE_DEFER)
 * 		dev_err(dev, ...);
 * 	else
 * 		dev_dbg(dev, ...);
 * 	return err;


We are not checking for EPROBE_DEFER in any of the drivers so there is
no point in doing the change.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

