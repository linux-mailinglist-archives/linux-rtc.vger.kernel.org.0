Return-Path: <linux-rtc+bounces-6768-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zy+LMl0aP2p4OwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6768-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2026 02:33:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1E6D09E5
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2026 02:33:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=RLBA68eq;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6768-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6768-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5FAE303AB6E
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2026 00:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5010B15B998;
	Sat, 27 Jun 2026 00:33:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5C7082D
	for <linux-rtc@vger.kernel.org>; Sat, 27 Jun 2026 00:33:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782520409; cv=none; b=VnsF/8KJAzMCQX59lgakC2qbV8WyH7OrFzYeIZrlNdDDCDS1vWVJ7vo0joxdTNCi8vrMEcS8wwkKPUaRtTTeP6mIsllcaWGZANmu5knmQuan/E6Cd7nPGGuMLICn0DqXQ6kwu4Td36Thz9gg41MTuikv1VkfqUS+uP/PeUIaD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782520409; c=relaxed/simple;
	bh=B3B4yO9P2L8o0IRObU9sjwviTxDzLvplw+tkThIuol4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iQcymACPp11d+PMKm2CTC8VNgasfinN8LR1EnLSiFcXAdbZTig3QFod3GzfSXFO0u/KzGPARpvO24vnavvDQj89ydEqEMELUsQgiPsUvoovfcVBupV2XZzAET5xC3TOIvQxg7BxTTa7/dwBqkMRx2DTtD0xcokQa56Y/qloCuEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RLBA68eq; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46cdcec58c2so1360881f8f.1
        for <linux-rtc@vger.kernel.org>; Fri, 26 Jun 2026 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782520405; x=1783125205; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jab/0pW1fz76Y5/uJAulqVYquWQ3NLRaXXuJvCZMKL0=;
        b=RLBA68eqBsfEIg2pvTXkA0KOMl0DJI51iYBk+iYbNzZ9BSWKEWZv16vYV2mGI5xTva
         POONeD4JgNDQDAu6CEiKzi8XO5o2OVzpzaqSKIYYi9OINzKW/viAU+xitYJuAngnyNH2
         ttxVeoT0cKC2sfR8C6x8cfAptfwCiUuJxCdw3ggRj1p3sBvLB9zFCpnIaldpO6XmmMuV
         sHWCpaS87c57rvo+EU0ORJwo48BK7RYvE0v9IxK4PDCjsO1APLZm/fEA3c4lfW9z7CWo
         5ZLfC6iMpBNlzQk7OCt6CYb2GfA5jzFpKU7h2WmIUulR/fHSZH5biFiHsRy1zY5kLKMK
         qpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782520405; x=1783125205;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jab/0pW1fz76Y5/uJAulqVYquWQ3NLRaXXuJvCZMKL0=;
        b=BvropIRpEyQ45I0/SCe8naT6ayK5knrLAJODNcFZ2B9un+XHSwvYaTHYVYCnl7WxtH
         YwPWQKqmCIyEpWqNKFmAFNoc1cYZKTK+2W6wjMIcarVGQWrnzn8EpGHBOcVqvEnHKfBa
         c5BT6lecUtFhFvkihb0Px6a2Zs7sM+hSDCwb3dF5zzNgcHVN0Ta2tCuUa0fwsk4lumGw
         3f7YaMfDf6RJ5XXHsdffDoXfOohMoMrXVHDIbXrVcm2Fc8enm1VdMh7hcoHt7jCW+RNp
         ETbjKNOrsiAKzkE1dR+Wpfoue8ytMpH6t3HretgVZnfI18ZuWuTrgjKtLuCRaN5AMijk
         jZwg==
X-Forwarded-Encrypted: i=1; AHgh+RrD+eln0rakHDRmatpZXOIXBgtAI5GmNbB6qRWM2FVY6JbpCXjP8Ok12XXmaDcOJjsq3skhpoVQem8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KlIK3UNjFOercZBCdym3CLBWYobFn5cVD7g4+jjthw2Wvu9f
	G4Q0TzE9+FxJ7f+HVE4lKwo+iZsDB/v7j3Pgj1rNB0LZGFUYPnzSwEK/BsG4JURglVBvLeEKxFp
	5N0o0xnQ=
X-Gm-Gg: AfdE7ckdC50Z1LLO6GaRtznERMzhHA3fci2UAjd1C3OsRDLP8L/pHh6RWS6FPtuWtYZ
	p4Xkdal7SttUdPDsnetCwIU64Zm+fktzYUR6M0l1IkM33nEWpr40vAcL2sHfD4WgKeAwVE96C/p
	aezFW1a/7QlHBdjWWTPV9WMmPjvxooX4xjEE3sW4eo5FDjEqcuQbN28uMZstMgS74NKMff7qz2h
	BQ7F+N7WdQANAB9TNySQjXDEpNK7JkE14B7a0Fpy5OFA7sn0ORThJQ3uoYp1aj1nKi3dxYZa6WT
	hnrYS90r+NEE5xEHm5BOk+51HBBlWZervLpnXFRFMWeWhp09TrzHrOSV6R6Jarl2SG8ispbxfRE
	UlDaas8Mh+dFTQJ/A3ajdn+d+7l0LHVaNVBKU0f9195Rfd+wezJJhVqs12RDdn6S5uP+dKc2Ouh
	uT1qI8St2hfM8Oi057lBygUoGUQbbi9u40/ydwQrnekQLSY5Qq2y81
X-Received: by 2002:a05:6000:4202:b0:45e:f295:33cd with SMTP id ffacd0b85a97d-46da8c5ff94mr14346680f8f.11.1782520405361;
        Fri, 26 Jun 2026 17:33:25 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46c2279b7d7sm27134685f8f.31.2026.06.26.17.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 17:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1] rtc: m41t80: clean up watchdog on probe failure
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260601194615.1979101-1-dbgh9129@gmail.com>
References: <20260601194615.1979101-1-dbgh9129@gmail.com>
Date: Sat, 27 Jun 2026 02:33:05 +0200
Message-Id: <178252038524.1704966.578320083174571195.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=B3B4yO9P2L8o0IRObU9sjwviTxDzLvplw+tkThIuol4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqPxpTnnStAlt+fcdNOnWbbPUR6gMo5dzxGfXAt
 sMvIMtdOB2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaj8aUwAKCRArRkmdfjHU
 RYv7EAC6mqQiftyPS0ElJPLknIRA/UbXiSs8fVm8lbjnaDvHfN3spnJk8qsTz8pdPBndNXbpIrl
 /4OXeIyCeftNBqAHHde3m9XTnOkrEgSe9hGywXR4rxzYjYrljPZssLeIR2QvSfAQvwMTvqn2kHP
 CDMxz4yhWWCbnMKLaZwr8PNoAT8FHUTtn720d0dMa3S0CbRlzfe+r5tYvSeFAGZC8nxluhGNxTv
 Wg4gaR2xfZrbUluJszk62ROmUaSqe16dYE2onxvDx9n8ph9twg8DT3EjF4VlAIJ4Unndhgb0kRa
 W3KWNprEdsOm0Vu+MN63GzQa9bABSGbnWlwidX+SObeb3kXxnY3KugE06AVCsQCAFs5I6syUC84
 VPt+HODuHKgc1D/1AgAhWXoIZIyjBlSQFF3fjDNEtMqjYpFeM/WeoapHD1dr99XKDjNT9iRYkKG
 Q8EELhPI+2R33N8J19jBIkNG5jomOctmibQzQDul1t7aCyuZBtHE31vhkHTy/2pFJK12ZfJhmub
 m1oC/Cni1U9DRjucaFITAe7xtxudluZCb+KJ8oOtefDUjQSvr7NjNjlcSY5zCl6GZM2QsE9PC8J
 KK65ZNwTfgOX3QluKeo4i2NfK8ETiYlSbWW6X627ZIhUczRJFATPPNvxsCHSdYvb+Y2oXyOiMBO
 WFnvcy6H3Gbhrgw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dbgh9129@gmail.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6768-lists,linux-rtc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22C1E6D09E5

On Mon, 01 Jun 2026 15:46:15 -0400, Yuho Choi <dbgh9129@gmail.com> wrote:
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index b26afef37d9c..f4a30320c6ed 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -1009,9 +1009,17 @@ static int m41t80_probe(struct i2c_client *client)
>  
>  	rc = devm_rtc_register_device(m41t80_data->rtc);
>  	if (rc)
> -		return rc;
> +		goto err_wdt;

IMHO the right fix is to move the watchdog to the watchdog core.

The leak comes from the watchdog being built on three non-devres
save_client. A probe failure strands all three, after which the watchdog
dereferences freed driver state (wdt_ping() reads
i2c_get_clientdata(save_client), i.e. the devres-freed m41t80_data).

Built on the watchdog core (CONFIG_WATCHDOG_CORE), none of that
machinery is needed:

- devm_watchdog_register_device() unregisters automatically on any probe
  failure and on unbind.
- watchdog_stop_on_reboot() replaces the reboot notifier.
- watchdog_set/get_drvdata() replaces the global save_client, closing
  the use-after-free surface itself.
- m41t80_remove() does nothing but watchdog teardown today, so it goes
  away too.

This is exactly what was done for the sibling driver rtc-ds1374, which
carried the same legacy pattern: d3de4beb14a8 ("rtc: ds1374: wdt: Use
watchdog core for watchdog part"), net -135 lines, adding "select
WATCHDOG_CORE" in Kconfig. It is a usable template.

primitives: a misc device, a reboot notifier, and the global

primitives: a misc device, a reboot notifier, and the global

-- 
Alexandre Mergnat <amergnat@baylibre.com>

