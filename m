Return-Path: <linux-rtc+bounces-6304-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJyiOPFT12kFMggAu9opvQ
	(envelope-from <linux-rtc+bounces-6304-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:23:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA083C6F96
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07ED9301AF4F
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Apr 2026 07:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C9937A4B9;
	Thu,  9 Apr 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oASyPTQh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA8371063
	for <linux-rtc@vger.kernel.org>; Thu,  9 Apr 2026 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719295; cv=none; b=HNtpza6dTj8uMjNF4VKNWyCs+lPH9n+LfDAz8IZpC+MA7zkHTvFxV+r6TX/E3WpbK2PAwqqf053rerM+Imb0pr1B6/H52ywQ6upSPUr8T9WNalU304O5mYDzghrKW9tzTEYtlBo4Nd5MexUpRxzj0+YELy/3ppMg4sN39Oekf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719295; c=relaxed/simple;
	bh=m96OQJeZXwqMAZDwEFgVBfZj0hp9r4nYmWS+ag9wmZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eguFgG/tNpzQZ3UoItY652e3+SQcLGMWcUlUDAgqApJ1lTStySURlUj3Jx1f799gxoQk6bVnfF8NxcHsvFBV/JxpxNwkwvNZMCeZsk0j9nzJMXmUMtXuyileDcFwmdCduDGyA1Z3kVTwBtXxr3PBqoVdDoWkt5yKYMeiXhXd3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oASyPTQh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cd9d0eceaso452426b3a.3
        for <linux-rtc@vger.kernel.org>; Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719293; x=1776324093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
        b=oASyPTQhEAJlqirFHCIxCH68iVrRqXErSTLW4TXLQdrvrsbUKlqH7G9bYYWk3xqhMV
         tsUFJMf/5n1NZVlW7RJjBVGXNYX+Gms38LzoVa26c3HbHM4GNnbUP6H0aMl0YxXLv5VE
         DMU/snF8cQ3Qn5eaQWnaJr7xMDgqwjgG74IU2Zjl++wpXYdzZYo/eng0oxXurvd99uix
         4fjNfJ5mugOibE5xfKkV2Rnd7WEjjEIlIWcRoVYrlV2Xpn0wI4XhBHdgSVyWsTwTcssj
         A8z7BWE5IMXRV9LTgA9vfj9uueCII3Dqo8G+u50xWSRiluTe5ihjUXe5uhPOcKy/IVU0
         Hl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719293; x=1776324093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
        b=qYx3FPjbYZHgjZ7Kf0GRzJrDQFVg+Oh0M9ryQly34LLpjc+wtLDh+nKyOZxmL7RQ6N
         SSGEgzing4TyBfVbe4hQXHNI7UosCJ+smEK2b+dnX7iZeUcIdxNl6LnrK1mymZ0TFcz6
         HRQ3aBi8MN+OW+5PN7MhV6GjcwLkoi3YH4vMCX71COIu/zadqugv2UdEfbo8ORAfoM1R
         IW7tIeYYJ/LJ+BygGB7Rh5M6PrlhdJA6hIfXzawQqAPbeuiIHVx83cx1zPVbFdb7lWsT
         PLrK9+imAzyrOdt/nYFo0Jdzj4z3NSDmIG0Moy/w77pJsQxszcdwKleNkh+BJ1770bcN
         3fMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRXUxk9rIlU2ndUWxguggP7pSlrEAqHKXRQ91RK+41RA3EcI2ZlEBgvNxHAAwttV4eqUuc6Vid2VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ31aite4wvvcmeO/NRDJ3wKkaD6LDMHa7GTq/NZ6zck+oxGtL
	3c1PWHpV3nQdxwpzHmvMSnR4H7UP8S20ziq91Sgn2vZh9qn+Z203yGAk
X-Gm-Gg: AeBDiettVuw7bR+gGX/Q75WZCgGJz45+2JU8Vh1dIiHPnw+9vYBR3w6tBCakK+9Pmw0
	Rw7PtAGT4bJ2qHVWRQn+2m4KmLgzYbq3MnorawfABUz2SsRLc2uM5wQ8a0qQbNe/RDP1P2b3AY/
	HWhhP1dGoPVnfnOSTkiN06N6nR9ifs05yoP3hZ86TvWXTgGMFv8EIJmHWviysIiGq9PPP1GzxhH
	cIm6XWgvHh0NUQ+N5sPV4kZ09YlaU3zwV5vp8WFTJpp19sJF83fsul6TgBN4uB94xjwl5MAGyX3
	yLYwevpJKSXU8ih4KbqTBOVEzVoM4cXW5eE5TcbEMn+K98zwDpT7D62DkS5o4jT8bZUKvOozCSo
	/odnFf+wp35NSYbU4TQtSmLPFXiJL/LwPuFAXPewjet3EBcV5+2tXi0W42tlQ0dQKXi+OQrm2VD
	2EZ3fP3WdulIVRr/wXsj5MvFRgEiCKoA2ojVdnWL+zMSgp7QE7+SmKuMaS1wGUGnZMTPM0uA==
X-Received: by 2002:a05:6a00:3902:b0:7f1:4:66b with SMTP id d2e1a72fcca58-82dd8b0da28mr2490958b3a.44.1775719293311;
        Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 2/2] rtc: nct3018y: add optional control register initialization
Date: Thu,  9 Apr 2026 15:21:05 +0800
Message-Id: <65d40ded5afd87d0dbdcf98652a97e4ad244505c.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775717959.git.tomato1220@gmail.com>
References: <cover.1775717959.git.tomato1220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[aj.id.au,gmail.com,google.com,nuvoton.com,lists.ozlabs.org,vger.kernel.org,quantatw.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-6304-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomato1220@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CA083C6F96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support the "nuvoton,ctrl-reg-val" Device Tree property to initialize
the RTC control register (0x0A) during the probe phase.

This provides flexibility for different platforms to override default
hardware settings.

Signed-off-by: David Wang <tomato1220@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cd4b1db902e9..4bc47b4ac935 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -534,6 +534,15 @@ static int nct3018y_probe(struct i2c_client *client)
 		}
 	}
 
+	if (!of_property_read_u32(client->dev.of_node, "nuvoton,ctrl-reg-val", &flags)) {
+
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, (u8)flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
+	}
+
 	flags = 0;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
 	if (err < 0) {
-- 
2.34.1


