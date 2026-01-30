Return-Path: <linux-rtc+bounces-5916-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OiNMvs3fWlMQwIAu9opvQ
	(envelope-from <linux-rtc+bounces-5916-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 00:00:11 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A27BF44A
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 00:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 222513048B14
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Jan 2026 22:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F01035CB64;
	Fri, 30 Jan 2026 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FsTQr4L2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBB35B627;
	Fri, 30 Jan 2026 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769813977; cv=none; b=nJNE7GLv5f+4id8bx3W+7MPh2rf5KXgaJ3oHfN2C3vQTz851iqka4gKTU9UQju1AHhcwIAQ0aag/ZG2fvEiUVe3UPW7b8qwOGi1TxrIoVJ5r4pko2sLPo5Q7PGxmJleOHaaM/qd/86Sr4d3KczX4PbJwGwBpr2NY8lSXOx4yPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769813977; c=relaxed/simple;
	bh=+EHRlhrVR76ytnY6PWLG2xjyqeAdxe3SlaPmnPD3eZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGCgCEUrSJTrIKi8QxwhCwGCm9BAYiq81qKfzSFAxPa7JBcS4jDsKuh42i7sXco5ENmWpcQULQmieT/EO2ibao9tW0YfPc3KjvFBprYul3NM8Jmxfzy0+zVBIu2LrXnuamn+tFDylLc4PIC/pGIEVLOXr9cZmD1zBFpOGgyffxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FsTQr4L2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF5311A2B4A;
	Fri, 30 Jan 2026 22:59:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8925E6075A;
	Fri, 30 Jan 2026 22:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67B9D119A88EC;
	Fri, 30 Jan 2026 23:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769813970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=V8/wK0gpIonOYlq25IjVFqB/T4q9qNCsR8JA2Xof+Mg=;
	b=FsTQr4L2a3lze89V3zbOYach8O66v4irn3L0ekVYq3aeFQkszl7x5gEGL/orRfRhOybLN7
	h7MriZgDHzpoIqxgq/EoH1MxSPcVYNKjMrQDuZsL5Gz2GbY42Xf0F+LCmvnQgAUcnhTgic
	aMj37f/hh8/VJ7L9iclI16wNwDfHOyV2SzilMzyugxNWSixY/RdbcHGblmtF6KpdHGB7y+
	xAc1WvhpsLyFPwExzw+li5J5tonIbLMX9lHWU7bks4Fr9wDPs9iEFwrigPIMZNZ5j9EiJG
	Zh+4Mv44aYrjRUhMplzxJidxu3kD7Hr4Fpx//3NzQprByfQNyewNfiDVZNrw1A==
Date: Fri, 30 Jan 2026 23:59:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v1 06/10] dt-bindings: rtc: cpcap-rtc: convert
 to schema
Message-ID: <176981393517.2222240.5285023713229862241.b4-ty@bootlin.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134302.45958-7-clamor95@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5916-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Queue-Id: 27A27BF44A
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 15:42:58 +0200, Svyatoslav Ryhel wrote:
> Convert RTC devicetree bindings for the Motorola CPCAP MFD from TXT to
> YAML format. This patch does not change any functionality; the bindings
> remain the same.
> 
> 

Applied, thanks!

[06/10] dt-bindings: rtc: cpcap-rtc: convert to schema
        https://git.kernel.org/abelloni/c/96a77ec577d4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

