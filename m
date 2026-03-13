Return-Path: <linux-rtc+bounces-6196-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO1/NBrls2ktcQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6196-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 11:21:14 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A728159D
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 11:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D12333013DF6
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 10:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D923839021C;
	Fri, 13 Mar 2026 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WXaTTql3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE03C2836B5;
	Fri, 13 Mar 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397271; cv=none; b=fv2dcGsyoZvBkwsolPkzXq8so1IdIz+KhAaUHJarlaGYFaTPlTwEPvS9p/4rRlYOUUVixUEugc6d7mIdHk+cO4I4bdDHtxA3nhOKmtugtXTEuuW9g1PmRCzDKR0VxXilA2NxCrKdx8zLCX6JzH3jekVg7xDMT3ucUqNYUdEpWHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397271; c=relaxed/simple;
	bh=hZtTwpBhTGEHeq+lDmlRqNA8NUSLraRIi0xYW44+7eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX917B5FaYfJgz6krIlo1mfUklx2NQ/T3G3r2bZQl+FuNFBybQriiaolt97Li4RljRbMrwWajxjBfBg7+WBfnJGlU0/CqVFSkULK3AMUNE6Eam4graVe4Z8FqY64V6KcFngBml7YOJmu2/mQnVVrZaSafhMf5ENPwvitONUxTYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WXaTTql3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40773C42707;
	Fri, 13 Mar 2026 10:21:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22D8460027;
	Fri, 13 Mar 2026 10:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56A2110369E5C;
	Fri, 13 Mar 2026 11:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773397254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gdrglww0REeOGT4Viqo+gy6Tlr6Kb5Mc5/XuGVQzle4=;
	b=WXaTTql3HYt60jxknmxJq80ggVUL/WeB5XD0TdoqCVxYZrLt1K+a9x7Ng895uuqSgjMaSP
	YflrJDFN47t1Y1dh+H7KGS1sQAt1ZlJ5gy3NFBnZ/m8bxc4eefreLqedcNS7+tdOqTobch
	GjSpOELfyZ1AEFdnZWhWaEyvX1r3pD2MYiTXRZajUTl/tVm+ZXhs0tAKaTFxuXl2q3lb+U
	pfsZdTevvCCcpAkJZ6ZNL5C2rxbzmiPWjny+V5UNi+324SXpNQ/Z4lBSsA7K7qB1BXc94e
	OoEH3FjaNdtwu/NQhSErc3Q0mpypSbqEJIhuABylcuwnhDZjxJpjcul5rGltFA==
Date: Fri, 13 Mar 2026 11:20:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: rtc: isl12026: convert to YAML schema
Message-ID: <177339713674.2795331.18049519008197599066.b4-ty@bootlin.com>
References: <20260227185115.174997-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227185115.174997-1-piyushpatle228@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6196-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: 6D0A728159D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Feb 2026 00:21:15 +0530, Piyush Patle wrote:
> Convert the ISL12026 RTC binding from text format to YAML schema.
> Remove the legacy text binding.
> 
> The new schema enables dtbs_check validation.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: isl12026: convert to YAML schema
      https://git.kernel.org/abelloni/c/5ff89ef425d1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

