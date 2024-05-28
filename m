Return-Path: <linux-rtc+bounces-1217-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C218D215D
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 18:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 248DC2845E0
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 16:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15DF171E54;
	Tue, 28 May 2024 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="XA3WfQHR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E06F06F
	for <linux-rtc@vger.kernel.org>; Tue, 28 May 2024 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912788; cv=none; b=E64bOaMi9Uzx1mcNQ0cX3h5sUHqhn9wVwiAMSfBbfWp5xzOxQdbsfxtejjsnDXaSMTta2aKoPd3bkv5D7XDiM4E5sIokwt7yzwEiftKoOTT7qWZPDUke1QUsG5tqcPTAFvnCluafIOyBzxvH5vsjDzQA02PFl4CaafX/0ULOxew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912788; c=relaxed/simple;
	bh=H5bDvYkv9qXbMe/o+hdZXmwMswlUAMuOc8qOkyDi6NM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gFrUWHTA/aMqcQRoA8yGsIb86i7NySJyDgo4L+wM+gTVRt4YsD2W38yZIR6iRCL0vXOcD6YevkAQn4a63iaU6Hgwypts9/rkogocpVb1HA8PUPmifA0gHKf1wTMivSHcLGzo637AVhZsmDhfXQ2w9sBYd8bKPFKqV56O/f+0UYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=XA3WfQHR; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 15F65A03B1;
	Tue, 28 May 2024 18:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=5DUJYrFsDEcG02QLOq4wUnmRlNkHMZZf6SuV0Flk6os=; b=
	XA3WfQHRhTwUqi7JbOVugZ86Id75PT1NOngi/z8qfe7DItlqYF1zG3itW2y+P0zj
	NKBbkf6N0+bgzfcitzcnbKPfB+CYuq2OQ/9KcQwd+g7wSO8NADrAtGVAfLKbbEqY
	1hOKVmyFz1zhPD3XpJnsZRLf42TLvtvmUlouaaK83xr95CMUp9v2EsWOOHaBPOWt
	TwQr0DomKWKmYCcEzDMR48orb0BLA7fFBnsqNhplGcQGUS7O9nY74k5E3dRJRaIO
	1DUBaoM9Fx6MV77lZmqU3Q6e3JN53SZz9Exb0kG5LcOaSGM5O5xno3lrXR6tfChv
	H6ne6k5W47rpyq181133IIqHBW1VN0KQnmycmbsU2YoaHICRK60PfAuxxyu+wPZo
	Wm5YIhzYsMaxftdyHnwwOekRsJw6RdVywX4f6KmJXXs+PN5vgGkXmlbm+Gzh5jtD
	iKjUiv1lTwZkJNEFlhd+AzxE6d+yhEh5hkTaebjaWAoTjUzoVDIhjBMPxk2Fa+Vw
	Ltoe8DS2YNvYHiKpZbE7nl8iEuqwsImsB4vyMpdpnj/ZEyQXFikXGHegieVK3/rL
	Rbf0/7LTIqn7VWyBzR4KbpdezEZG6LPf77FuJLsOJAzy+Di0fCxvG2hunEoYc7WP
	Kq6B1o/nN/dA64k2vN8qkkQURWaHhSZ6W7MaflKGiNw=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH 0/2] Add proper Update handling to PCF212x
Date: Tue, 28 May 2024 18:12:40 +0200
Message-ID: <20240528161242.404352-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1716912775;VERSION=7972;MC=2030024178;ID=93592;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A12957637165

The PCF212x family is capable of sending interrupts when
its value changes. The RTC core, on the other hand, relies
on setting an alarm to the next second to get an Update
Interrupt. This can sometimes fail, if the Alarm Flag
is not cleared in time, causing a lost Update event.

FYI the patches were made against the v6.8 tag.

Csókás, Bence (2):
  rtc: Add UIE handling ability to rtc_class_ops
  rtc: pcf2127: Add UIE capability through Seconds Interrupt

 drivers/rtc/interface.c   |  8 ++++++++
 drivers/rtc/rtc-pcf2127.c | 24 ++++++++++++++++++++++++
 include/linux/rtc.h       |  1 +
 3 files changed, 33 insertions(+)

-- 
2.34.1



