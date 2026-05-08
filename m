Return-Path: <linux-rtc+bounces-6482-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UlxKNutF/WnrZwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6482-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 04:09:47 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 580714F0B38
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 04:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CCC6301681F
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2026 02:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D593D24503B;
	Fri,  8 May 2026 02:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="LtIeCe7t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8E31F4176;
	Fri,  8 May 2026 02:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778206184; cv=none; b=FD14MWqq37Vr1TDaVqWe7Y0TchYlXuhQZOJ07kAvIMkJoRLhFwzFTbBPbk40lJAIdKrv2LZRXJCMGqWFIfU2CuxZwK9Xp3x9QVHoyGeZD7400CAH3iCpt6NAgWo/t5bzT3ABHX5tgtg/kXLBylr7U1SnkrBLwAMLvqdQrmkCe/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778206184; c=relaxed/simple;
	bh=iPMhb6UP2TqRypwHU6eLXgB/wuE1FQB73LYt63Zl9rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4dl1BwwDVPXKSN6Iuc4hB/cbw743JVHOz7uOQ0VA6v8nGf8baBM/ToMQkF8z7OjBfAzWs52VLBsLgqXIhAnoKSS0/wz9XHprMNKNd3BBZCksfFTDEbVB+gETWmgPUmL0pikmrgk/EuGPpvgW/cQr9ljlEp1Disq08g48dbuj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=LtIeCe7t; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.160.40] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id CC3E620B7165;
	Thu,  7 May 2026 19:09:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CC3E620B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778206179;
	bh=iPMhb6UP2TqRypwHU6eLXgB/wuE1FQB73LYt63Zl9rQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtIeCe7tOLaejOUB1KnVQjgHraznJceMvSfM2fQDM/UAONwtTKFJWAuRvHMcvsZ5M
	 w0xNrhsyfSwEqYLFf0MGuKoTGHcqFl0tBBjGb6szJTodEL6fxieQDpQAhAQMhw9LlW
	 bjW1+szlG4s8lLbYxap1hK8pbi1d9KgpA5dET+dY=
Message-ID: <0ef9de5c-4b1d-461a-98e9-b04fb430fdde@linux.microsoft.com>
Date: Thu, 7 May 2026 19:09:42 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
To: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>,
 alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, Sasha Levin <sashal@kernel.org>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
Content-Language: en-US
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
In-Reply-To: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 580714F0B38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6482-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meaganlloyd@linux.microsoft.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.microsoft.com:mid,linux.microsoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On 4/30/2026 9:46 PM, Ronan Dalton wrote:
> An alternative to this change could be just to revert the referenced two
> commits and not use the OSF bit at all, apart from logging a warning and
> clearing it on probe.
Can you remove this from the commit message?

