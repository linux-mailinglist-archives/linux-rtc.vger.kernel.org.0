Return-Path: <linux-rtc+bounces-5966-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGZbJYKKjWnq3wAAu9opvQ
	(envelope-from <linux-rtc+bounces-5966-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Feb 2026 09:08:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E552912B1C5
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Feb 2026 09:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58FE2306374C
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Feb 2026 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF632C0F7A;
	Thu, 12 Feb 2026 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKDL9Ipl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7ED287276
	for <linux-rtc@vger.kernel.org>; Thu, 12 Feb 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770883711; cv=none; b=NRLSWitHhUl2O39q5rc2HkoJalbk4lj9HpwZFyVuajsE6Zu80HxRzFtTlNIHgGduqcrxkVnzvCzO17GGccXtlcbrkyoHahtcas265LtXuOJHilXh+NpA5MbBFsfiu4OkUynbeuHQfvWvbcXK9i+H5J01Nw1sJ+Fyo7jpOmeE7GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770883711; c=relaxed/simple;
	bh=4/fME0Nbb9Te7LFoqBGqC091sYb8uUFD+M7c3hXlCG4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XvTXczdeSBRDqtyn4ToVMfbSD/XsigOpuk9apG46CJrdy29cI9QuFnTbfnUK9ICvGsCUKoAvB+jKTwLluSKIrwE2vUJKwZFmWAYWed82SpB+Bk9dlv5BOpQbNWxY/WLAlS5XtodJQTJCK9Iy4Nmw1e7MlWseGnyHyw0LUhHhY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKDL9Ipl; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-65941c07e8dso9403779a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 12 Feb 2026 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770883709; x=1771488509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4/fME0Nbb9Te7LFoqBGqC091sYb8uUFD+M7c3hXlCG4=;
        b=VKDL9IplWt84Utmo39GPRqfmtnrP8xEnUcuRehLjSrdKXbvyiz/CWUqCTIUj0/g4/W
         6QafgnTnsmFgjuC5C+IMGcvFw3oUPK817ZIW17GUaTh2VNRyAH8LVOikvs7l0+OUAPkU
         yYZLnZei+/7XEGrDjI9OHTOrl0cQN9v1i5x5T16d1j3sC9GCLLGjMeiYPAc4rIqgDAah
         x0XH5FlRBxEoNYnaTWmZcme3495OHEudWzxRFmgwc8OQb6KC+baIlTQoW6uwLzNqDrBz
         5bc/lo/v/T5s4lm67K1kQ9llnT0+lPGu0eZN9eq/MrO9Dr4j3T3nR/EJ4WAzYMvOG8tb
         Vmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770883709; x=1771488509;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/fME0Nbb9Te7LFoqBGqC091sYb8uUFD+M7c3hXlCG4=;
        b=bOMnz9TZutyM6sUXH6C/qHzIOgPQZDQmzWv5TNvyRnnb68islMtvr08sw9V/M+mMiD
         grQOIZbqFkmzRBuEm+nTNTJtBmYy3/GUnMN9j+4DL4Vx9JC+cquX4MHC59nB86IVjAc5
         aMN7rW1/rGgpEw/a8wZs6HC0IQvYQZRL7Dbe9LV6Lp0d+yohU0+zy26G/4phfC4B3h/5
         vRlUWZA4K4smAPbmttJmjNE2W9OJ6tI9qmciTDsKBAJk8gtENVDNzOxnq9YK986fwGTi
         nlr6p+rkNdPAPnKjl6hytydU0I78DTOpGfb5uY5Yo6SlIe9QgLcXfiAjlZzKN4dor91V
         YK8g==
X-Forwarded-Encrypted: i=1; AJvYcCUFb2WB1FaGTQZnbXW3RHtzVqlfQNYhE5xRyTO688iioaMxdEY8gqVu9g50iFISxxMIP+W7uWdCsK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpQf4DHvV2PVlRs/LNBZfQeJ6de6sju1xmix+nyJq/g/8R0rr
	QSYUZRAIs1yRS01csw/RCdkZMWZ48EGEBgoGcWxqOSWP5uPrU8h1QPfU
X-Gm-Gg: AZuq6aL3KWqKTL+DFhl3wQLblI943TSihxONvXS4iAySOZFXyUfcw94bbBpKFZIkje6
	EhBp7baQdMmciERdsqojV2oHjMjMvlXsAPvTWqSGU7T60LuE8d71OmpWU34WNaKEjfWbbFpUSso
	WOP2WP0MJKhf0WhSU2XjgEeAy/o4E7FL05TrEefarMdUfwcQiuqAJf4a8XtLjgCn3zJ4SsZwMJa
	zPRwrWtos6xy5kjbY8OKIDJTzzG0TL3bgJs5NhBlv5FV+bjPmrk03FWVV3w6tgo8orJSrrtvYq0
	ZoSRcA10ty7DHqwk1tJ6uA8lypqx3MmnUseSnOurBcsubxAJUa/LQ/X1a+vU/8BJnJxL05LpVHO
	ssY70tgb8HlpP6rXAz2PcqYy4MZpHSYMf1BmXgGsjxG2ofysfrFjapGDE34wgEzR+5LP/sedYqU
	AF3TWgd+Jtr79oGg4iLWuiVmO/u4MKYsJs
X-Received: by 2002:a17:907:3ea0:b0:b8e:92e:d30b with SMTP id a640c23a62f3a-b8f8f3aef4cmr93020766b.21.1770883708218;
        Thu, 12 Feb 2026 00:08:28 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.204.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f990cd966sm20559866b.39.2026.02.12.00.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 00:08:27 -0800 (PST)
Date: Thu, 12 Feb 2026 10:08:25 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/2=5D_dt-bindings=3A_mfd=3A_maxi?=
 =?US-ASCII?Q?m=2Cmax77686=3A_document_optional_RTC_address?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a58587d3-65ec-4d40-aab9-dca08278c2f2@kernel.org>
References: <20260211184941.6756-1-clamor95@gmail.com> <20260211184941.6756-2-clamor95@gmail.com> <a58587d3-65ec-4d40-aab9-dca08278c2f2@kernel.org>
Message-ID: <8E149750-19F1-4274-BD24-B13ED47D1D51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5966-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E552912B1C5
X-Rspamd-Action: no action



12 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 09:26:33 GM=
T+02:00, Krzysztof Kozlowski <krzk@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On 11/02/2026 19:49, Svyatoslav Ryhel wrote:
>> Document an optional second I2C address for the PMIC's RTC device, to b=
e
>> used if the RTC is located at a non-default I2C address
>
>MAX77686 did not allow changing the I2C address and there are no other
>devices in the bindings=2E
>

That is true, MAX77663 RTC does this, should I adjust Documentation/device=
tree/bindings/mfd/max77620=2Etxt instead?

>
>Best regards,
>Krzysztof

