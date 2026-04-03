Return-Path: <linux-rtc+bounces-6287-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK+VD87Uz2kQ1AYAu9opvQ
	(envelope-from <linux-rtc+bounces-6287-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Apr 2026 16:55:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E1395697
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Apr 2026 16:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AD373014FF0
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2026 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0ED330B10;
	Fri,  3 Apr 2026 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i/ee+v9P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CAF225788
	for <linux-rtc@vger.kernel.org>; Fri,  3 Apr 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228108; cv=none; b=Ess8PwZix3jWme53ifg2BLClbJnPiFPHHxeCjAFGkM6gMmaOaUId5EphhSKQhH7rlelJOUE9V9ushiFklqupinvRbgmgrfY4o+QOTGDeevKLtYYvF4WWCX/KQcKWtiZuOHe6aQK5pkmC2ThfvOfzAcbeTH3DuiiYwpBa6ZqYhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228108; c=relaxed/simple;
	bh=moRfUaCKGRHrIPsmKEcuie4HMNNxCx3R2LG1IkoBPao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uTqc41uW4aLDAgmJ7+cCpPGEfHamKWrsRMvAt9mkTnYDoSPkvd9bdcSCA88LKfIaCk+1mKjnvB0fSLLlY+jhu+EYS2h0UzNYJVpt+5Mv8gFzGbW7iQjQi+wA1srYrygVexxsa2ZRu20x/AzuzprbVZjwXJ/6+veG/AdopwSGgFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i/ee+v9P; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5A4274E428D1;
	Fri,  3 Apr 2026 14:55:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20B0C603C1;
	Fri,  3 Apr 2026 14:55:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2795610450008;
	Fri,  3 Apr 2026 16:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775228103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=moRfUaCKGRHrIPsmKEcuie4HMNNxCx3R2LG1IkoBPao=;
	b=i/ee+v9Pk098wypohgd+shjzpuGg2UQUH7rDGX+tLnDzETY6jkhMRsL549WP2GqvupYQQZ
	C/FHlCnn/XvcuxyVYp1bf+GZe/IMI2PPEXgeAitQroQit7NA268r75YTbuBkOQ1rKDPGMM
	WMRu4y3LPkNjQVr+d7pbBvBgWKvT1gQItWBHluhrjbH/ZVkqJBJCvROAWzxxRi+khFkMLP
	XK4u/4mxGQPFHktv54+pzU5BSf3CZuvhxpfOWZjKTkb/YI+Aek3keiMe7mUn82A3RJy5cz
	IV6H9Rs8oH8FHfR8UuocheXYrqvxxxK5ntFBNee1k077YOL3y/LbQxftqSU7Bg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, 
 syzbot+2d4127acca35ed7b31ad@syzkaller.appspotmail.com
In-Reply-To: <20260317-irq_data-v1-1-a2741002be60@igalia.com>
References: <20260317-irq_data-v1-1-a2741002be60@igalia.com>
Subject: Re: (subset) [PATCH] rtc: add data_race() in rtc_dev_poll()
Message-Id: <177522808279.1505743.13265710217895705235.b4-ty@b4>
Date: Fri, 03 Apr 2026 16:54:42 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=154;
 i=alexandre.belloni@bootlin.com; h=from:subject:message-id;
 bh=moRfUaCKGRHrIPsmKEcuie4HMNNxCx3R2LG1IkoBPao=;
 b=owEBbQKS/ZANAwAKAWOk3DBscDoyAcsmYgBpz9S2C5muC97HzOAoQc2qq3/VovGEtyXx51WPN
 e/pI6n0a5SJAjMEAAEKAB0WIQQGqwVVleHyz/Q7kmJjpNwwbHA6MgUCac/UtgAKCRBjpNwwbHA6
 Mp5jEACAOoG/4xIkI0NTIMs9U8Vggi3H9XdH9i1pADKCvNvPGXt/AOjazDpK7rld5B5vD7dCSoA
 iuYONm4SyYZ+NYr3K8oppnD45I0PdY6htv07WkrMwnWNT44t+o1S5Ry8xepsu6mCC4Ll4furO+E
 XywB5sf336D6HUfi6M6MfhxVbhclp1s35uQ3Q3rpvw4gzC5/+YOWdydqBiCzcnwizxQnC0IqcQM
 4ZMaoJz++DeEz0YJf1SgLYz0eNcu0Gnxb99wMtNekty3GA82pHaf4aUoLNYHfsLEsTWDtvI0cE9
 3MhGcBza1L0a5rSeuFwVcgdtP841NvfryQolAzDfc1zDAKozU7FI+pFpdm7GqFTXsbvrNHIGO6M
 VH8XUBF+QbbkKE6NjkWoyDc7cEQNh1vCvP8IvtN47OM7FnCGyjSTKX3Dfg0YXeLsO8G+8x+iPws
 88y8z/rRgwd464jKOerUTTLCFyl8GGxCm4HpXkcPRHhpaWPU5yjYc2w0cB7t092gg4T4nvY4PwN
 QtnXTzhit2zJnE1iF9zxZ6+mbH/u/UIUSKMVjhZWojpqX4FvzLQFNHXcLVs8ch1HyIVrdVN2cMp
 L1TpJUiDBNihUbFStSIiDIKOp/qIr49/6FuB0TZPd46B277L/FRECklzjzuqnGuH1JG3mOFyCT4
 VJegI7Wf6sTOL+A==
X-Developer-Key: i=alexandre.belloni@bootlin.com; a=openpgp;
 fpr=D42657F65BEB9D45A004FCFAA6CD9F096F642CB3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6287-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,2d4127acca35ed7b31ad];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim]
X-Rspamd-Queue-Id: D96E1395697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 20:22:16 -0300, Mauricio Faria de Oliveira wrote:
> rtc: add data_race() in rtc_dev_poll()

Applied, thanks!



Best regards,


