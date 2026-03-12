Return-Path: <linux-rtc+bounces-6183-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANLKF+nOsmmPPwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6183-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 15:34:17 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF02736FE
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 15:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F5823012B52
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 14:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5763372664;
	Thu, 12 Mar 2026 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X/wF4OuN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F35370D63;
	Thu, 12 Mar 2026 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773326054; cv=none; b=nm8n2rMlA9+un3PM4eMER7qIxj2fNSufaKn509/07NbzHwZjBq0vBAqDIfvSPruuUAw7fJyAB6ln6k09l7VSWC3xN/nKcU6yXaiKeHEtALWsR8xrK6osKzWqFJ/v0yca3TTBuF9Etc6t8FW0YMPIlpqfxqY8t7/olF7VAP2x1Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773326054; c=relaxed/simple;
	bh=DOXA6QtsfzkZPROElG3yAh0IASFe2LRsfsSO4JQZbbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmsHR79g/5RpkUlve7gYUFhylyMuQ/vNSA2wFWkjuJnnFqtud3mTK8+n/KnxbTzHYze4nPT9gkx+XcqvjkJcpK49UOF9geQ5mIZ06dkXsgNO3Z5Y+K0Ky9pO8mo9TlfldSUXeeiTzh5xRmGESgT3PFtt+oNoJWsW5rdjYvpPQ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X/wF4OuN; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3F48C415B4;
	Thu, 12 Mar 2026 14:34:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F10485FDEB;
	Thu, 12 Mar 2026 14:34:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D4E510369D8B;
	Thu, 12 Mar 2026 15:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773326049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IBs7k57OeLZl/WMHraT3wf8w2tDAH3Uvkw+ViJVliHE=;
	b=X/wF4OuNChjYf6mq9RusOsq+XlL7gpw5GZCEQCwbd6pRxOuxqqVIts4CnqBhy/aWl8uMDb
	dlUGmPIXCP/4k0r8QJ+vCO/Cshsgau8fY9M9kktiaDCPtO5ndFe+uoisB5xDpJZ7Kr/cRK
	KkIzOmqp+VKMPWRt8bMx6QK5Yl0mMrpuJjMq3aWebtUX1e/jgk7KqJAnS2MaI3xK5j7ndn
	G6a5YFC9HGul9Kni9og7/uPJ7U40H4tuZxW+67qE8vzxXIwuHC5fn2WAWoCxn5jQftt0rX
	LNE8IwGd3qSmWIEDolv5JDf3edvfXpVVZIhZmd6h4shFDOnA1Nq9Rjok+kEQAw==
Date: Thu, 12 Mar 2026 15:34:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: rtc: mpfs-rtc: permit resets
Message-ID: <177332604245.2624597.12073186352013045323.b4-ty@bootlin.com>
References: <20260303-flounder-slate-dd69766990ce@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-flounder-slate-dd69766990ce@spud>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6183-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BCF02736FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 03 Mar 2026 16:36:33 +0000, Conor Dooley wrote:
> The RTC on mpfs and pic64gx has a reset pin, but until now this has been
> undocumented because platform firmware takes the RTC out of reset on
> first-party boards (or those using modified versions of the vendor
> firmware), but not all boards may take this approach. Permit providing a
> reset in devicetree for Linux, or other devicetree-consuming software,
> to use.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: mpfs-rtc: permit resets
      https://git.kernel.org/abelloni/c/cbf39bfd4bf9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

